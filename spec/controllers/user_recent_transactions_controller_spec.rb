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

    it 'should redirect to welcome page if user is alredy filled the form' do
      user.create_recent_transaction()

      sign_in(user)

      get :new

      expect(response).to redirect_to(welcome_path)
    end
  end
end
