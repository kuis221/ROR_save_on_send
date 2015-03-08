class CreateUserInputErrors < ActiveRecord::Migration
  def change
    create_table :user_input_errors do |t|
      t.references :user
      t.string :location
      t.string :messages, limit: 2048
    end
  end
end
