class AddCurrencyCodeIntoCountries < ActiveRecord::Migration
  def change
    add_column :countries, :currency_code, :string, limit: 3
  end
end
