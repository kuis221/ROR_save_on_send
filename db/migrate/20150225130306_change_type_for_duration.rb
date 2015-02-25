class ChangeTypeForDuration < ActiveRecord::Migration
  def change
    change_column :remittance_terms, :duration, :string
  end
end
