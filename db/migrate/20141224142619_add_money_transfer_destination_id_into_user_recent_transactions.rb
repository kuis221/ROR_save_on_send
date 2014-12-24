class AddMoneyTransferDestinationIdIntoUserRecentTransactions < ActiveRecord::Migration
  def change
    add_column :user_recent_transactions, :money_transfer_destination_id, :integer
  end
end
