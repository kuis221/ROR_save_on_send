require 'spec_helper'

describe UserNextTransfersController do
  render_views

  let(:user){FactoryGirl.create(:confirmed_user)}

  describe 'GET show' do
    it 'should display info about best options for next transfer' do
      get :show, user_next_transfer: FactoryGirl.attributes_for(:next_transfer).merge(money_transfer_destination_id: FactoryGirl.create(:india).id)

      expect(response).to be_ok
      expect(response.body).to have_content('Best options for your next transfers')
    end

    it 'show not be possible to get next transfer by id' do
      get :show, id: 1

      expect(response).to redirect_to(new_user_next_transfers_path)
    end
  end

  describe 'GET new' do
    it 'should be possible to select destination country if user is not sign in' do
      get :new

      expect(response.body).to have_selector("input[name='user_next_transfer[money_transfer_destination_id]']")
    end

    it 'should not be possible to change destination country if user is already signed in' do
      sign_in(user)

      get :new

      expect(response.body).to_not have_selector("input[name='user_next_transfer[money_transfer_destination_id]']")
    end
  end

  describe 'POST create' do
    let(:next_transfer_attrs){
      next_transfer_attrs = FactoryGirl.attributes_for(:next_transfer)
      next_transfer_attrs.delete(:user)
      next_transfer_attrs[:money_transfer_destination_id] = FactoryGirl.create(:india).id
      next_transfer_attrs
    }

    let(:not_valid_attrs){
      next_transfer_attrs[:amount_send] = 0
      next_transfer_attrs[:amount_receive] = 0
      next_transfer_attrs
    }

    it 'should be possible to create next transfer if user is not sign in' do
      expect{
        post :create, user_next_transfer:  next_transfer_attrs
      }.to change(User::NextTransfer, :count).by(1)
    end

    it 'should track validation error' do
      sign_in(user)

      expect{
        post :create, user_next_transfer:  not_valid_attrs
      }.to change(User::InputError, :count).by(1)
    end

    it 'should track valid error event if user is not present' do
      expect{
        post :create, user_next_transfer:  not_valid_attrs
      }.to change(User::InputError, :count).by(1)
    end

    it 'should track validation error' do
      sign_in(user)
      
      post :create, user_next_transfer:  not_valid_attrs
      
      last_input_error = User::InputError.last

      expect(last_input_error.location).to eq('user_next_transfers')
      expect(last_input_error.messages).to eq('Amount send must be greater than 0,Amount receive must be greater than 0')
      expect(last_input_error.user).to eq(user)
    end

  end
end
