class CreateFxRates < ActiveRecord::Migration
  def change
    create_table :fx_rates do |t|
      t.string :text, limit: 16384
      t.timestamps
    end
  end
end
