class UserNextTransfersController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :set_prefered_currency, only: [:new, :show]

  layout 'landing', only: [:new]

  def new
    @user_next_transfer = User::NextTransfer.new(params[:user_next_transfer])
  end

  def show
    begin
      @user_next_transfer = User::NextTransfer.new(permited_params)
    rescue ActionController::ParameterMissing
    end

    if @user_next_transfer.nil? || @user_next_transfer.invalid?
      redirect_to(new_user_next_transfers_path) 
    else
      destination_country = if current_user 
                            current_user.money_transfer_destination
                          else
                            @user_next_transfer.money_transfer_destination
                          end

      @least_expensive_remittance_terms = RemittanceTerm.least_expensive(
          amount_send: @user_next_transfer.amount_send,
          amount_receive: @user_next_transfer.amount_receive,
          receive_country: destination_country,
          receive_currency: @user_next_transfer.receive_currency,
          send_method: @user_next_transfer.originating_source_of_funds,
          receive_method: @user_next_transfer.destination_preference_for_funds
      )

      # display payment methods (from-to) if flag is set
      if @least_expensive_remittance_terms
        @from_to_show = @least_expensive_remittance_terms.select(&:highlight).present?
      end
    end
  end

  def create
    # remove decimal part from amount send and receive
    if params[:amount_type] == '1'
      params[:user_next_transfer][:amount_send] = params[:user_next_transfer][:amount_send].gsub(',', '_').to_i
      params[:user_next_transfer][:amount_receive] = 0
    elsif params[:amount_type] == '2'
      params[:user_next_transfer][:amount_send] = 0
      params[:user_next_transfer][:amount_receive] = params[:user_next_transfer][:amount_receive].gsub(',', '_').to_i
    end

    if params[:user_next_transfer][:money_transfer_destination_id]
      cookies[:money_transfer_destination_id] = params[:user_next_transfer][:money_transfer_destination_id]

      selected_country = Country.find(params[:user_next_transfer][:money_transfer_destination_id])
      params[:user_next_transfer][:receive_currency] = selected_country.receive_currency.first if selected_country.receive_currency.size == 1
    end

    if current_user.nil? && cookies[:money_transfer_destination_id]
      params[:user_next_transfer][:money_transfer_destination_id] = cookies[:money_transfer_destination_id]
    end

    next_transfer_attrs = permited_params

    if current_user
      @user_next_transfer = current_user.next_transfers.create(next_transfer_attrs)
    else
      @user_next_transfer = User::NextTransfer.create(next_transfer_attrs)
    end

    if @user_next_transfer.persisted?
      redirect_to(user_next_transfers_path(user_next_transfer: next_transfer_attrs))
    else
      set_prefered_currency
      render :new
    end
  end

  protected
  def permited_params
    params.require(:user_next_transfer).permit(:amount_send, :amount_receive, 
      :receive_currency, :originating_source_of_funds_id, 
      :destination_preference_for_funds_id, :money_transfer_destination_id
    )
  end
end
