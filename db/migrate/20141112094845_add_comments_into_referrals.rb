class AddCommentsIntoReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :comments, :string
  end
end
