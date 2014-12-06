require 'spec_helper'

describe UserRecentTransactionsController do
  let(:user){FactoryGirl.create(:user, confirmed_at: Time.current)}

  describe 'GET new' do
    it "should display form for input recent transaction data if user haven't filled this for yet do" do
      sign_in(user)

      get :new

      expect(response).to be_ok
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let!(:recent_transaction_attrs) do 
      attrs = FactoryGirl.attributes_for(:recent_transaction)
      attrs[:feedback_attributes] = {comments: 'n/a', service_quality: 4}
      attrs
    end
    
    it 'should create new record with information about user recent transaction' do
      sign_in(user)

      expect{
        post :create, user_recent_transaction: recent_transaction_attrs 
      }.to changing(User::RecentTransaction, :count).by(1)
    end

    it 'should create new service provider record if user is specified other provider' do
      sign_in(user)

      recent_transaction_attrs.delete(:user)
      recent_transaction_attrs.delete(:service_provider_id)
      recent_transaction_attrs[:service_provider_attributes] = {name: 'Other Provider'}

      expect{
        post :create, user_recent_transaction: recent_transaction_attrs
      }.to changing(ServiceProvider, :count).by(1)

      expect(ServiceProvider.last.name).to eq('Other Provider')
      expect(ServiceProvider.last.created_by).to eq(user)
    end
    
    it 'should not create new service provider record if user is specified other provider' do
      sign_in(user)

      recent_transaction_attrs[:service_provider_attributes] = {name: 'Other Provider'}
      
      expect{
        post :create, user_recent_transaction: recent_transaction_attrs
      }.to_not changing(ServiceProvider, :count)
    end
  end
end
