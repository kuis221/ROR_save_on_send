require 'spec_helper'

describe UsersController do
  let(:user){FactoryGirl.create(:confirmed_user)}
  let(:avatar_path){Rails.root.join('spec', 'fixtures', 'files', 'avatar.png')}

  before do
    Cloudinary.config do |config|
      config.cloud_name = 'test_cloud'
    end

    allow_any_instance_of(AvatarUploader).to receive(:store!)
    allow(Cloudinary::Uploader).to receive(:destroy)
  end

  describe 'PATCH update' do
    it 'should upload avatar' do
      sign_in(user)

      patch :update, format: :json, user: {avatar: fixture_file_upload(avatar_path, 'image/png')}

      expect(response).to be_ok
      
      upload_response = JSON.parse(response.body)
      expect(upload_response['name']).to be_present
      expect(upload_response['size']).to be_present
      expect(upload_response['url']).to be_present
    end
  end
end
