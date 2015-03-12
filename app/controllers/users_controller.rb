class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      format.html do 
        @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :zipcode, :about_me))
        
        if @user.valid?
          redirect_to(edit_user_path)
        else
          render(:edit)
        end
      end
      
      format.json do 
        if params[:avatar].present?
          preloaded = Cloudinary::PreloadedFile.new(params[:avatar])         
          raise "Invalid upload signature" if !preloaded.valid?
          
          Cloudinary::Uploader.destroy(@user.avatar, invalidate: true) if @user.avatar.present?

          @user.update_attribute(:avatar, preloaded.identifier)
        end

        render(json: @user.valid?)
      end
    end
  end
end
