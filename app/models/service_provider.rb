class ServiceProvider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :feedbacks, ->{where(approved: true)}, as: :commendable
  has_many :recent_transactions, inverse_of: :service_provider, class_name: User::RecentTransaction

  belongs_to :created_by, polymorphic: true

  scope :created_by_admin, ->{where(created_by: Admin.all)}

  def display_feedbacks
    @display_feedbacks ||= (
      recent_transactions.joins(:feedback).where('feedbacks.approved is TRUE').map(&:feedback) + 
      feedbacks
    ).select{|user| user.present?}
     .sort{|feedback_a, feedback_b| feedback_b.created_at <=> feedback_a.created_at}
  end
end
