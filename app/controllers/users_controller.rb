class UsersController < ApplicationController
  before_filter :redirect_to_recent_transaction

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    @user.update_attributes(params.require(:user).permit(:zipcode, :money_transfer_destination_id))

    if @user.valid?
      redirect_to(new_user_recent_transaction_path)
    else
      render(:edit)
    end
  end

  private
  def redirect_to_recent_transaction
    redirect_to(new_user_recent_transaction_path) if current_user.complete?
  end
end
