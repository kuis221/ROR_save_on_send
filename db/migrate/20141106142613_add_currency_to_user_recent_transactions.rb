class AddCurrencyToUserRecentTransactions < ActiveRecord::Migration
  def up
    add_column :user_recent_transactions, :currency, :string, limit: 3
    remove_column :user_recent_transactions, :amount_sent_currency
    remove_column :user_recent_transactions, :amount_received_currency
  end

  def down
    remove_column :user_recent_transactions, :currency
    add_column :user_recent_transactions, :amount_sent_currency, :string, limit: 3
    add_column :user_recent_transactions, :amount_received_currency, :string, limit: 3
  end
end
