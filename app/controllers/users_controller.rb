class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :zipcode, :about_me, :avatar))
    
    respond_to do |format|
      format.html do
        if @user.valid?
          redirect_to(root_path)
        else
          render(:edit)
        end
      end

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
