class ChangeTypeForSendAbountRangeFields < ActiveRecord::Migration
  def change
    change_column :remittance_terms, :send_amount_range_from, :float
    change_column :remittance_terms, :send_amount_range_to, :float
  end
end
