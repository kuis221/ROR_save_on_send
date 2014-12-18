class Feedback < ActiveRecord::Base
  belongs_to :commendable, polymorphic: true
  belongs_to :user

  validates_presence_of :user, :service_quality, :comments

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
