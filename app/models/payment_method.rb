class PaymentMethod < ActiveRecord::Base
  validates_presence_of :slug

  scope :for_receiving, ->{where.not(slug: 'card')}
end
