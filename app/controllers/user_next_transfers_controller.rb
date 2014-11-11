class UserNextTransfersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user_next_transfer = User::NextTransfer.new(params[:user_next_transfer])
  end

  def create
    next_transfer_attrs = params.require(:user_next_transfer)
      .permit(:amount_send, :amount_receive, :receive_currency, 
              :originating_source_of_funds_id, :destination_preference_for_funds_id)

    @user_next_transfer = current_user.next_transfers.create(next_transfer_attrs)

    if @user_next_transfer.persisted?
      redirect_to(welcome_path)
    else
      render :new
    end
  end
end
