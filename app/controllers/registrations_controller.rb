class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :zipcode, :money_transfer_destination_id,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :zipcode, :money_transfer_destination_id,
        :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = 'Verification email was sent to your email address - please click link in that email to confirm'
    welcome_path
  end
end
