class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string  :name
      t.index   :name
    end
  end
end
