class ServiceProvidersController < ApplicationController
  def show
    @provider = ServiceProvider.friendly.find(params[:id])
    @provider_feedback = Feedback.new(commendable: @provider)
  end
end
