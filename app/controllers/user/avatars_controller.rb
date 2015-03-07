class AvatarsController < ApplicationController
  before_filter :authenticate_user!
  
  def destroy
    respond_to do |format|
      format.json do
        render json: current_user.remove_avatar!
      end
    end
  end
end
