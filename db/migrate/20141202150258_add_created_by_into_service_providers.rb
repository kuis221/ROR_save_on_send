class AddCreatedByIntoServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :created_by_id, :integer
    add_column :service_providers, :created_by_type, :string
  end
end
