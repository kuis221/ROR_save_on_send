require 'spec_helper'

describe UserRecentTransactionsController do
  render_views

  let(:user){FactoryGirl.create(:user, confirmed_at: Time.current)}

  describe 'GET new' do
    before :each do
      FactoryGirl.create(:payment_method, :cash)
      FactoryGirl.create(:payment_method, :card)

      FactoryGirl.create(:service_provider, :western_union)
    end

    it "should display form for input recent transaction data if user haven't filled this for yet do" do
      sign_in(user)

      get :new

      expect(response).to be_ok
      expect(response).to render_template(:new)
    end

    it 'should be possible to select destination country if user is not sign in' do
      get :new

      expect(response.body).to have_selector("input[name='user_recent_transaction[money_transfer_destination_id]']")
    end

    it 'should not be possible to change destination country if user is already signed in' do
      sign_in(user)

      get :new

      expect(response.body).to_not have_selector("input[name='user_recent_transaction[money_transfer_destination_id]']")
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

    it 'should return page with error if comments is more than 512 characters' do
      sign_in(user)
      
      long_comments = ''
      520.times{long_comments += 'a'}

      recent_transaction_attrs[:feedback_attributes][:comments] = long_comments

      post :create, user_recent_transaction: recent_transaction_attrs

      expect(response).to render_template(:new)
    end
  end
end
