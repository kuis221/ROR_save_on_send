class User::NextTransfer < ActiveRecord::Base
  belongs_to :user

  belongs_to :originating_source_of_funds, class_name: PaymentMethod
  belongs_to :destination_preference_for_funds, class_name: PaymentMethod

  monetize :amount_send_cents
  monetize :amount_receive_cents, with_model_currency: :receive_currency
 
  # Use model level currency
  register_currency :usd

  # validation
  validates_presence_of :originating_source_of_funds, :destination_preference_for_funds
  validates_presence_of :receive_currency
  
  validates_numericality_of :amount_send, greater_than: 0, unless: :amount_receive_present?
  validates_numericality_of :amount_receive, greater_than: 0, unless: :amount_send_present?

  def payment_methods_same_as(remittance_term)
    originating_source_of_funds == remittance_term.send_method &&
      destination_preference_for_funds == remittance_term.receive_method
  end

  private
  def amount_send_present?
    amount_send_cents > 0
  end

  def amount_receive_present?
    amount_receive_cents > 0
  end
end
