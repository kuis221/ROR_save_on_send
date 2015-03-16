# == Schema Information
#
# Table name: user_levels
#
#  id   :integer          not null, primary key
#  name :string(255)
#  slug :string(255)
#

class User::Level < ActiveRecord::Base
end
