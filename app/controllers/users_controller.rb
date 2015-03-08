class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if params[:avatar].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:avatar])         
      raise "Invalid upload signature" if !preloaded.valid?
      @user.avatar = preloaded.identifier
    end

    @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :zipcode, :about_me))

      format.json do
        if @user.avatar
          render json: {
                        name: @user.full_name, 
                        size: @user.avatar.size, 
                        url: @user.avatar_url,
                        thumbnail_url: @user.avatar_url,
                        delete_url: user_avatar_path,
                        delete_type: 'DELETE'
          }
        else
          render json: [{error: "custom_failure"}], status: 304
        end
      end
    end
  end
end
