class AddSlugIntoServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :slug, :string
    add_index :service_providers, :slug
  end
end
