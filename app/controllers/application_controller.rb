class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  protected
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    flash[:alert] = nil
    
    if resource_or_scope.is_a?(Admin)
      rails_admin_path
    else
      if current_user.complete?
        new_user_recent_transaction_path
        #current_user.recent_transactions.empty? ? new_user_recent_transaction_path : welcome_path
      else
        edit_user_path
      end
    end
  end

  def set_locale
    if http_accept_language.header.present?
      I18n.locale = http_accept_language.compatible_language_from([:en, :es, :'zh-CN'])
    else
      I18n.locale = :en
    end
  end

  def set_prefered_currency
    if current_user.present? || cookies[:money_transfer_destination_id].present?
      @prefered_currency = current_user.present? ? current_user.prefered_currency : Country.find(cookies[:money_transfer_destination_id].to_i).receive_currency
    end
  end

  def track_input_error(object = nil)
    object ||= resource
    if object.errors.present?
      User::InputError.create(user: current_user, 
                          location: params[:controller], 
                          messages: object.errors.full_messages.join(','))
    end
  end
end
