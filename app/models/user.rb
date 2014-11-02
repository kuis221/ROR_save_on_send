class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :money_transfer_destination, class_name: Country

  # validations
  validates_presence_of :first_name
  validates_presence_of :zipcode
  validates_presence_of :money_transfer_destination
end
