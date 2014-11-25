class AddNameEsIntoCountries < ActiveRecord::Migration
  def change
    add_column :countries, :name_es, :string
  end
end
