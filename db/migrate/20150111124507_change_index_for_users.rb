class ChangeIndexForUsers < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, [:email, :phone], unique: true
  end

  def down
    add_index :users, :email, unique: true
    remove_index :users, [:email, :phone]
  end
end
