class AddNameEsIntoPaymentMethods < ActiveRecord::Migration
  def change
    add_column :payment_methods, :name_es, :string
  end
end
