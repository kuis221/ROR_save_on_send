class WelcomeController < ApplicationController
  before_filter :redirect_to_root

  private
  def redirect_to_root
    redirect_to(root_path) if !user_signed_in? && flash.empty?
  end
end
