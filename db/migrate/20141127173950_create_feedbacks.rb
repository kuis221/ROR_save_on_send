class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string      :comments, limit: 512
      t.integer     :service_quality
      t.references  :user
      t.references  :commendable
      t.string      :commendable_type
      t.boolean     :approved, default: false
      t.timestamps
    end
  end
end
