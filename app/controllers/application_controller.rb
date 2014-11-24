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
      current_user.recent_transactions.empty? ? new_user_recent_transaction_path : welcome_path
    end
  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
