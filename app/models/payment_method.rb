# == Schema Information
#
# Table name: payment_methods
#
#  id   :integer          not null, primary key
#  name :string(255)
#  slug :string(255)      not null
#

class PaymentMethod < ActiveRecord::Base
  validates_presence_of :slug

  scope :for_receiving, ->{where.not(slug: 'card')}
end
