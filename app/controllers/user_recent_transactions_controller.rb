class UserRecentTransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user_recent_transaction = User::RecentTransaction.new(params[:user_recent_transaction])
  end

  def create
    params[:user_recent_transaction][:documentation_requirements] = params[:user_recent_transaction][:documentation_requirements].join(',')

    # remove decimal part from amount send and receive
    params[:user_recent_transaction][:amount_sent] = params[:user_recent_transaction][:amount_sent].to_i
    params[:user_recent_transaction][:amount_received] = params[:user_recent_transaction][:amount_received].to_i

    recent_transaction_attrs = params.require(:user_recent_transaction)
      .permit(:date, :currency, :amount_sent, :amount_received, :originating_source_of_funds_id,
              :service_provider_id, :destination_preference_for_funds_id, :fees_for_sending,
              :fees_for_receiving, :send_to_receive_duration, :send_to_receive_duration_interval,
              :documentation_requirements, :promotion, :service_quality, :comments)

    @user_recent_transaction = current_user.recent_transactions.create(recent_transaction_attrs)

    if @user_recent_transaction.persisted?
      notice = I18n.t('notice.best_rate_html')

      more_money = RemittanceTerm.save_on_transaction(@user_recent_transaction)

      if more_money > 0
        destination_country = current_user.money_transfer_destination.name

        notice = I18n.t('notice.save_on_transaction_html',
                        destination_country: destination_country,
                        saving: more_money.to_i,
                        currency: more_money.currency.iso_code)
      end

      redirect_to(new_user_next_transfer_path, notice: notice)
    else
      render :new
    end
  end

  private
end
