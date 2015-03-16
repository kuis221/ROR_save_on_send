# == Schema Information
#
# Table name: user_input_errors
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  location :string(255)
#  messages :string(2048)
#

class User::InputError < ActiveRecord::Base
  belongs_to :user
end
