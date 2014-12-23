class AddMoneyTransferDestinationIntoUserNextTransfers < ActiveRecord::Migration
  def change
    add_column :user_next_transfers, :money_transfer_destination_id, :integer
  end
end
