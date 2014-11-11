class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.references :user
      t.string     :email
      t.timestamps
    end
  end
end
