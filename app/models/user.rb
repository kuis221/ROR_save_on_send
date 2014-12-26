class User < ActiveRecord::Base
  PHONE_REGEX = /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable,
         :omniauthable, omniauth_providers: [:facebook]

  belongs_to :money_transfer_destination, class_name: Country

  has_many :recent_transactions, class: User::RecentTransaction
  has_many :next_transfers, class: User::NextTransfer

  has_many :feedbacks

  has_many :referrals

  # validations
  #validates_presence_of :first_name
  #validates_presence_of :zipcode, unless: :skip_additional_info?
  #validates_presence_of :money_transfer_destination, unless: :skip_additional_info?

  validates :phone, uniqueness: {case_sensitive: false}, format: {with: PHONE_REGEX}, 
    presence: true, if: :email_blank?

  before_validation :fill_phone, on: :create

  def password_required?
    super if confirmed?
  end

  def email_required?
    phone_blank?
  end

  def prefered_currency
    money_transfer_destination.try(:receive_currency)
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end

  def skip_additional_info!
    @skip_additional_info = true
  end

  def skip_additional_info?
    @skip_additional_info
  end

  def complete?
    zipcode.present? && money_transfer_destination.present?
  end

  def phone_blank?
    phone.blank?
  end

  def email_blank?
    email.blank?
  end

  # FIXME we not send confirmation instruction while we don't have custom confirmation
  # page
  def send_confirmation_instructions
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.skip_confirmation!
      user.skip_additional_info!
    end
  end

  private
  def fill_phone
    if email.match(PHONE_REGEX)
      self.phone = email
      self.email = ''
    end
  end
end
