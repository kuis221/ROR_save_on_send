# == Schema Information
#
# Table name: feedbacks
#
#  id               :integer          not null, primary key
#  comments         :string(512)
#  service_quality  :integer
#  user_id          :integer
#  commendable_id   :integer
#  commendable_type :string(255)
#  approved         :boolean          default(FALSE)
#  created_at       :datetime
#  updated_at       :datetime
#

class Feedback < ActiveRecord::Base
  belongs_to :commendable, polymorphic: true
  belongs_to :user

  validate :service_quality_and_comments
  validates_length_of :comments, maximum: 512

  protected
  def service_quality_and_comments
    
    if service_quality.nil? || comments.blank?
      err_msg = if service_quality.nil? && comments.blank?
                  'service_quality_and_comments.blank'
                elsif service_quality.nil?
                  'service_quality.blank'
                elsif comments.blank?
                  'comments.blank'
                end

      errors.add(:service_quality_and_comments, 
                 I18n.t(err_msg, scope: 'activerecord.errors.models.feedback.attributes')
      )
    end
  end

  # rails admin configuration
  rails_admin do
    list do
      field :comments
      field :service_quality
      field :user
      field :commendable
      field :approved, :toggle
    end
  end
end
