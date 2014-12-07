class ServiceProvider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :feedbacks, ->{where(approved: true).where.not(user: nil)}, as: :commendable
  has_many :recent_transactions, inverse_of: :service_provider, class_name: User::RecentTransaction

  belongs_to :created_by, polymorphic: true

  scope :created_by_admin, ->{where(created_by: Admin.all)}

  def display_feedbacks
    @display_feedbacks ||= (
      recent_transactions.joins(:feedback)
      .where('feedbacks.approved is TRUE').where.not(user: nil).map(&:feedback) + 
      feedbacks
    ).sort{|feedback_a, feedback_b| feedback_b.created_at <=> feedback_a.created_at}
  end
end
