class PaymentMethod < ActiveRecord::Base
  include NameLocalization

  validates_presence_of :slug
end
