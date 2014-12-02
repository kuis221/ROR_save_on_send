class ServiceProvider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :feedbacks, ->{where(approved: true)}, as: :commendable
  has_many :recent_transactions, inverse_of: :service_provider

  belongs_to :created_by, polymorphic: true

  scope :created_by_admin, ->{where(created_by: Admin.all)}
end
