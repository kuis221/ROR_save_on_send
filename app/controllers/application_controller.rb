class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    flash[:alert] = nil
    
    if resource_or_scope.is_a?(Admin)
      rails_admin_path
    else
      current_user.recent_transaction.nil? ? new_user_recent_transaction_path : welcome_path
    end
  end
end
