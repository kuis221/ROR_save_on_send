class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_filter :set_money_destination, only: [:create]

  protected

  def set_money_destination
    if current_user.nil? && cookies[:money_transfer_destination_id]
      params[:user][:money_transfer_destination_id] = cookies[:money_transfer_destination_id]
    end
  end

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :zipcode, :money_transfer_destination_id,
        :email, :password, :password_confirmation, :accept_emails, :accept_terms)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :zipcode, :money_transfer_destination_id,
        :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_inactive_sign_up_path_for(resource)
    cookies[:money_transfer_destination_id] = resource.money_transfer_destination.id
  
    if resource.email.present?
      welcome_path(verification_type: :email)
    else
      flash[:notice] = nil
      session[:phone] = resource.phone
      user_confirmation_path
    end
  end
end
