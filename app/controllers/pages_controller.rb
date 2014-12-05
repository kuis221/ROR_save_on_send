class PagesController < ApplicationController
  def show
    render template: Page.get_template(params[:id])
  end
end
