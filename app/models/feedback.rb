class Feedback < ActiveRecord::Base
  belongs_to :commendable, polymorphic: true
  belongs_to :user

  validates_presence_of :user
end
