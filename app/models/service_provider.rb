class ServiceProvider < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :feedbacks, ->{where(approved: true)}, as: :commendable
  has_many :recent_transactions, inverse_of: :service_provider, class_name: User::RecentTransaction

  belongs_to :created_by, polymorphic: true

  scope :created_by_admin, ->{where(created_by: Admin.all)}

  def display_feedbacks
    @display_feedbacks ||= all_feedbacks.sort{|feedback_a, feedback_b| feedback_b.created_at <=> feedback_a.created_at}
  end

  def average_rating
    all_feedbacks_size = all_feedbacks.size
    
    @average_rating ||= if all_feedbacks_size > 0
      all_feedbacks.inject(0){|sum, feedback| sum += feedback.service_quality}
      .fdiv(all_feedbacks.size)
      .round
    end
  end

  def all_feedbacks
    recent_transactions.joins(:feedback).where('feedbacks.approved is TRUE').map(&:feedback) + 
    feedbacks
  end

  def self.for_country(country)
    ServiceProvider.created_by_admin.where(id: RemittanceTerm.where(receive_country: country).group(:service_provider_id).pluck(:service_provider_id))
  end
end
