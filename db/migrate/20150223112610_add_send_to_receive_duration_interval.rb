class AddSendToReceiveDurationInterval < ActiveRecord::Migration
  def change
    add_column :user_recent_transactions, :send_to_receive_duration_interval, :string
  end
end
