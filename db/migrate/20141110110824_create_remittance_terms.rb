class CreateRemittanceTerms < ActiveRecord::Migration
  def change
    create_table :remittance_terms do |t|
      t.references :receive_country
      t.references :service_provider
      t.references :send_method
      t.references :receive_method
      t.string     :receive_currency, limit: 3
      t.integer    :send_amount_range_from
      t.integer    :send_amount_range_to
      t.money      :fees_for_sending, currency: {present: false}
      t.float      :fees_for_sending_percent
      t.float      :fx_markup
      t.integer    :duration
      t.text       :documentation
      t.string     :promotions
      t.integer    :service_quality
    end
  end
end
