require 'spec_helper'

describe UsersController do
  let(:user){FactoryGirl.create(:confirmed_user)}

  before :each do
    allow_any_instance_of(Cloudinary::PreloadedFile).to receive(:valid?).and_return(true)
  end

  describe 'PATCH update' do
    it 'should upload avatar' do
      sign_in(user)

      patch :update, format: :json, avatar: 'upload/image/v123/public_id.jpg#321'

      expect(response).to be_ok
      expect(response.body).to eq('true')
    end
  end
end
