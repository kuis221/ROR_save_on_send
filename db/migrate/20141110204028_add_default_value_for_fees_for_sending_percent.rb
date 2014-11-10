class AddDefaultValueForFeesForSendingPercent < ActiveRecord::Migration
  def up
    change_column :remittance_terms, :fees_for_sending_percent, :float, default: 0
  end
  
  def down
    change_column :remittance_terms, :fees_for_sending_percent, :float
  end
end
