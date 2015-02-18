require 'spec_helper'

describe AvatarsController do
  let(:user){FactoryGirl.create(:confirmed_user)}
  let(:avatar_path){Rails.root.join('spec', 'fixtures', 'files', 'avatar.png')}

  before do
    Cloudinary.config do |config|
      config.cloud_name = 'test_cloud'
    end

    allow_any_instance_of(AvatarUploader).to receive(:store!)
    allow(Cloudinary::Uploader).to receive(:destroy)
  end

  describe 'DELETE destroy' do
    it 'should delete avatar' do
      sign_in(user)

      user.update_attribute(:avatar, File.open(avatar_path))

      delete :destroy, format: :json

      expect(response).to be_ok
     
      expect(assigns[:current_user].avatar.url).to be_nil
    end
  end
end
