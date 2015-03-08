class AddDateIntoFxRates < ActiveRecord::Migration
  def change
    add_column :fx_rates, :date, :date
  end
end
