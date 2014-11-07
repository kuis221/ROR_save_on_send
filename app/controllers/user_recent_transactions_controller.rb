class UserRecentTransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user_recent_transaction = User::RecentTransaction.new(params[:user_recent_transaction])
  end

  def create
    params[:user_recent_transaction][:documentation_requirements] = params[:user_recent_transaction][:documentation_requirements].join(',')

    recent_transaction_attrs = params.require(:user_recent_transaction)
      .permit(:date, :currency, :amount_sent, :amount_received, :originating_source_of_funds_id,
              :service_provider_id, :destination_preference_for_funds_id, :fees_for_sending, 
              :fees_for_receiving, :send_to_receive_duration, :send_to_receive_duration_interval,
              :documentation_requirements, :promotion, :service_quality, :comments)

    @user_recent_transaction = current_user.recent_transactions.create(recent_transaction_attrs)
    
    if @user_recent_transaction.persisted?
      redirect_to(welcome_path, notice: 'Thank you! Your input is stored.')
    else
      render :new
    end
  end

  private
end
