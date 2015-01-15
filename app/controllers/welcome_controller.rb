class WelcomeController < ApplicationController
  before_filter :redirect_to_root

  def index
    # we don't need to display devise message on this page
    flash[:notice] = nil

    verification_type = params[:verification_type] || :email
    @welcome_message = I18n.t("welcome.index.verification_#{verification_type}_was_sent")
  end

  private
  def redirect_to_root
    redirect_to(root_path) if !user_signed_in? && flash.empty?
  end
end
