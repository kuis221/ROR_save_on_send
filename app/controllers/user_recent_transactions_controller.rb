class UserRecentTransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :not_allow_fill_form_twice

  def create
    params[:user_recent_transaction][:documentation_requirements] = params[:user_recent_transaction][:documentation_requirements].join(',')

    recent_transaction_attrs = params.require(:user_recent_transaction)
      .permit(:date, :currency, :amount_sent, :amount_received, :originating_source_of_funds_id,
              :service_provider_id, :destination_preference_for_funds_id, :fees_for_sending, 
              :fees_for_receiving, :send_to_receive_duration, :send_to_receive_duration_interval,
              :documentation_requirements, :promotion, :service_quality, :comments)

    if current_user.create_recent_transaction(recent_transaction_attrs)
      redirect_to(root_path)
    else
      render :new
    end
  end

  private

  def not_allow_fill_form_twice
    redirect_to(welcome_path) if current_user.recent_transaction.present?
  end
end
