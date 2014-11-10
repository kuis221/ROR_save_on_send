class AddSlugIntoPaymentMethods < ActiveRecord::Migration
  def change
    add_column :payment_methods, :slug, :string, null: false
  end
end
