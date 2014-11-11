class CreateUserNextTransfers < ActiveRecord::Migration
  def change
    create_table :user_next_transfers do |t|
      t.references  :user
      t.money       :amount_send, currency: {present: false}
      t.money       :amount_receive, currency: {present: false}
      t.string      :receive_currency, limit: 3
      t.references  :originating_source_of_funds
      t.references  :destination_preference_for_funds
      t.timestamps
    end
  end
end
