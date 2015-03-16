# == Schema Information
#
# Table name: referrals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  comments   :string(255)
#

class Referral < ActiveRecord::Base
  # validation
  validates_presence_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
