class RenameFeesForSendingToFeesForSendingCents < ActiveRecord::Migration
  def up
    remove_column :user_recent_transactions, :fees_for_sending
    add_money :user_recent_transactions, :fees_for_sending, currency: {present: false}
  end

  def down
    remove_column :user_recent_transactions, :fees_for_sending_cents
    add_column :user_recent_transactions, :fees_for_sending, :string
  end
end
