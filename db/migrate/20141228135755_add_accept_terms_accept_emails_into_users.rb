class AddAcceptTermsAcceptEmailsIntoUsers < ActiveRecord::Migration
  def change
    add_column :users, :accept_terms, :boolean
    add_column :users, :accept_emails, :boolean
  end
end
