class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  belongs_to :money_transfer_destination, class_name: Country

  has_many :recent_transactions, class: User::RecentTransaction
  has_many :next_transfers, class: User::NextTransfer

  has_many :referrals

  # validations
  validates_presence_of :first_name
  validates_presence_of :zipcode
  validates_presence_of :money_transfer_destination

  def prefered_currency
    [Money.default_currency.iso_code, money_transfer_destination.try(:currency_code)]
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end
end
