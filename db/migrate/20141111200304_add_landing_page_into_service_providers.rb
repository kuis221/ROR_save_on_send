class AddLandingPageIntoServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :landing_page, :string, limit: 512
  end
end
