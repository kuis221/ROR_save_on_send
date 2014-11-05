class CreateUserRecentTransaction < ActiveRecord::Migration
  def change
    create_table :user_recent_transactions do |t|
      t.references  :user
      t.date        :date
      t.money       :amount_sent
      t.money       :amount_received
      t.references  :originating_source_of_funds
      t.references  :service_provider
      t.references  :destination_preference_for_funds
      t.string      :fees_for_sending
      t.string      :fees_for_receiving
      t.integer     :send_to_receive_duration
      t.string      :documentation_requirements
      t.string      :promotion
      t.integer     :service_quality
      t.text        :comments
      t.timestamps
    end
  end
end
