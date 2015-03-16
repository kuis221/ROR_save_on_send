require 'spec_helper'

describe AvatarsController do
  let(:user){FactoryGirl.create(:confirmed_user)}

  before(:each) do
    allow(Cloudinary::Uploader).to receive(:destroy)  
  end

  describe 'DELETE destroy' do
    it 'should delete avatar' do
      sign_in(user)

      user.update_attribute(:avatar, 'public_id')

      delete :destroy, format: :json

      expect(response).to be_ok
     
      expect(assigns[:current_user].avatar).to be_nil
    end
  end
end
