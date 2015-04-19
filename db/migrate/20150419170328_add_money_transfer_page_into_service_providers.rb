class AddMoneyTransferPageIntoServiceProviders < ActiveRecord::Migration
  def change
    add_column :service_providers, :money_transfer_page, :string, limit: 512
  end
end
