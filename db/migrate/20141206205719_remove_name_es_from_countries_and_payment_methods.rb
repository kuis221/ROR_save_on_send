class RemoveNameEsFromCountriesAndPaymentMethods < ActiveRecord::Migration
  def up
    remove_column :countries, :name_es
    remove_column :payment_methods, :name_es
  end

  def down
    add_column :countries, :name_es, :string
    add_column :payment_methods, :name_es, :string
  end
end
