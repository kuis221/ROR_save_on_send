class UserRecentTransactionsController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :set_prefered_currency, only: [:new]

  def new
    @user_recent_transaction = User::RecentTransaction.new(params[:user_recent_transaction])
  
    set_service_providers
  end

  def create
    #params[:user_recent_transaction][:documentation_requirements] = params[:user_recent_transaction][:documentation_requirements].join(',')

    # remove decimal part from amount send and receive
    params[:user_recent_transaction][:amount_sent] = params[:user_recent_transaction][:amount_sent].gsub(',', '_').to_i
    params[:user_recent_transaction][:amount_received] = params[:user_recent_transaction][:amount_received].gsub(',', '_').to_i

    if params[:user_recent_transaction][:money_transfer_destination_id]
      cookies[:money_transfer_destination_id] = params[:user_next_transfer][:money_transfer_destination_id]

      selected_country = Country.find(params[:user_recent_transaction][:money_transfer_destination_id])
      params[:user_recent_transaction][:currency] = selected_country.receive_currency.first if selected_country.receive_currency.size == 1
    end

    if current_user.nil? && cookies[:money_transfer_destination_id]
      params[:user_recent_transaction][:money_transfer_destination_id] = cookies[:money_transfer_destination_id]
    end

    # convert date from string
    begin
      params[:user_recent_transaction][:date] = Date.strptime(params[:user_recent_transaction][:date], '%m/%d/%Y') if params[:user_recent_transaction][:date]
    rescue
    end

    recent_transaction_attrs = params.require(:user_recent_transaction)
      .permit(:date, :currency, :amount_sent, :amount_received, :originating_source_of_funds_id,
              :service_provider_id, :destination_preference_for_funds_id, :fees_for_sending,
              :fees_for_receiving, :send_to_receive_duration, :send_to_receive_duration_interval,
              :documentation_requirements, :promotion,
              :money_transfer_destination_id,
              service_provider_attributes: [:name, :landing_page], 
              feedback_attributes: [:service_quality, :comments]
             )

    if recent_transaction_attrs[:service_provider_id].present? && recent_transaction_attrs[:service_provider_attributes].present?
      recent_transaction_attrs.delete(:service_provider_attributes)
    end

    if recent_transaction_attrs[:service_provider_attributes].present?
      recent_transaction_attrs[:service_provider_attributes][:created_by] = current_user
    end

    if recent_transaction_attrs[:feedback_attributes].present? && current_user.present?
      recent_transaction_attrs[:feedback_attributes][:user] = current_user
    end

    if current_user.present?
      @user_recent_transaction = current_user.recent_transactions.create(recent_transaction_attrs)
    else
      @user_recent_transaction = User::RecentTransaction.create(recent_transaction_attrs) 
    end

    if @user_recent_transaction.persisted?
      notice = I18n.t('notice.best_rate')

      more_money = RemittanceTerm.save_on_transaction(@user_recent_transaction)

      if more_money > 0
        destination_country = if current_user.present?
                                current_user.money_transfer_destination.name
                              else
                                @user_recent_transaction.money_transfer_destination.name
                              end

        notice = I18n.t('notice.save_on_transaction',
                        destination_country: destination_country,
                        saving: more_money.to_i,
                        currency: more_money.currency.iso_code)
      end

      redirect_to(new_user_next_transfer_path, notice: notice)
    else
      set_prefered_currency
      set_service_providers

      render :new
    end
  end

  protected
  def set_service_providers
    if current_user.present? || cookies[:money_transfer_destination_id].present?
      if current_user.present?
        @service_providers = ServiceProvider.for_country(current_user.money_transfer_destination)
      else
        money_transfer_destination = Country.find(cookies[:money_transfer_destination_id].to_i)
        @service_providers = ServiceProvider.for_country(money_transfer_destination)
      end
    end

    @service_providers ||= ServiceProvider.created_by_admin
  end
end
