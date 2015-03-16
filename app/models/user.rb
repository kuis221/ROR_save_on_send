# == Schema Information
#
# Table name: users
#
#  id                            :integer          not null, primary key
#  email                         :string(255)      default(""), not null
#  encrypted_password            :string(255)      default(""), not null
#  reset_password_token          :string(255)
#  reset_password_sent_at        :datetime
#  remember_created_at           :datetime
#  sign_in_count                 :integer          default(0), not null
#  current_sign_in_at            :datetime
#  last_sign_in_at               :datetime
#  current_sign_in_ip            :inet
#  last_sign_in_ip               :inet
#  confirmation_token            :string(255)
#  confirmed_at                  :datetime
#  confirmation_sent_at          :datetime
#  unconfirmed_email             :string(255)
#  failed_attempts               :integer          default(0), not null
#  unlock_token                  :string(255)
#  locked_at                     :datetime
#  first_name                    :string(255)
#  last_name                     :string(255)
#  zipcode                       :string(255)
#  money_transfer_destination_id :integer
#  created_at                    :datetime
#  updated_at                    :datetime
#  provider                      :string(255)
#  uid                           :string(255)
#  phone                         :string(255)
#  accept_terms                  :boolean
#  accept_emails                 :boolean
#  level_id                      :integer
#  points                        :integer          default(0)
#  about_me                      :string(1024)
#  avatar                        :string(255)
#

class User < ActiveRecord::Base
  US_PHONE_REGEX = /\A(?:\([2-9]\d{2}\)\ ?|[2-9]\d{2}(?:\-?|\ ?))[2-9]\d{2}[- ]?\d{4}\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable,
         :omniauthable, omniauth_providers: [:facebook],
         authentication_keys: [:login]

  belongs_to :money_transfer_destination, class_name: Country

  has_many :recent_transactions, class: User::RecentTransaction
  has_many :next_transfers, class: User::NextTransfer

  has_many :feedbacks

  has_many :referrals

  belongs_to :level, class_name: User::Level

  #mount_uploader :avatar, AvatarUploader  

  # validations
  #validates_presence_of :first_name
  #validates_presence_of :zipcode, unless: :skip_additional_info?
  validates_presence_of :money_transfer_destination, unless: :skip_additional_info?

  validates :phone, uniqueness: {case_sensitive: false}, format: {with: US_PHONE_REGEX}, 
    presence: true, if: :email_blank?

  validates_acceptance_of :accept_terms, allow_nil: false, 
    accept: true, on: :create

  before_validation :fill_phone, on: :create

  validates_presence_of :first_name, :zipcode, on: :update
  validates_format_of :zipcode, with: /\A[0-9]{5}(?:-[0-9]{4})?\Z/, on: :update
  validate :validity_of_confirmation_code, on: :update, if: :email_blank?

  attr_accessor :confirmation_code

  # login by email or phone : begin
  def login=(login)
    @login = login
  end

  def login
    @login || self.email || self.phone
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(phone) = :value OR lower(email) = :value", {value: login}]).first
    else
      where(conditions.to_h).first
    end
  end
  # login by email or phone : end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
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
    email.blank? && phone.present?
  end

  def phone_with_international_code
    if phone.present?
      "+1#{phone.gsub(/[^\d]/, '')}"
    end
  end

  # new function to set the password without knowing the current password used in our confirmation controller. 
  def attempt_set_password_and_required_parameters(params)
    confirmation_form_params = %i{password password_confirmation first_name last_name zipcode confirmation_code}
    p = {}
    confirmation_form_params.each {|attr_name| p[attr_name] = params[attr_name]}
    update_attributes(p)
  end
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def password_match?
    password == password_confirmation
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}    
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.skip_additional_info!
    end
  end

  def send_confirmation_instructions_by_sms
    # send confirmation instruction by phone

    begin
      Twilio::REST::Client.new.messages.create(
        from: Rails.application.secrets.twilio_phone_number,
        to: phone_with_international_code,
        body: I18n.t('sms.confirmation_code', code: self.confirmation_token)
      )
    rescue Twilio::REST::RequestError => e
      self.errors.add(:base, I18n.t('sms.sending_failed'))
      raise ActiveRecord::Rollback
    end

    self
  end

  def remove_avatar!
    result = false

    if avatar.present?
      Cloudinary::Uploader.destroy(avatar, invalidate: true)
      update_attribute(:avatar, nil)
    
      result = true
    end

    result
  end

  protected
  def generate_confirmation_token
    if email.present?
      super
    else
      token = rand(10000..99999)
      self.confirmation_token = token
      self.confirmation_sent_at = Time.now.utc
    end
  end

  def send_on_create_confirmation_instructions
    if email.present?
      send_confirmation_instructions
    elsif phone.present?
      send_confirmation_instructions_by_sms
    end
  end

  def send_confirmation_notification?
    confirmation_required? && !@skip_confirmation_notification && (self.email.present? || self.phone.present?)
  end

  private
  def fill_phone
    if email.match(US_PHONE_REGEX)
      self.phone = email
      self.email = ''
    end
  end

  def validity_of_confirmation_code
    errors.add :confirmation_code unless confirmation_token == confirmation_code
  end

  # Rails Admin Settings
  rails_admin do
    list do
      field :email do
        label 'Email'
      end
      field :phone
      field :first_name
      field :last_name
      field :zipcode
      field :money_transfer_destination
      field :created_at
    end

    show do
      field :email do
        label 'Email'
      end

      field :phone
      field :first_name
      field :last_name
      field :avatar
      field :zipcode
      field :money_transfer_destination
      field :level
      field :points
      field :about_me
      field :accept_terms
      field :accept_emails

      field :recent_transactions
      field :next_transfers
      field :feedbacks
      field :created_at
    end

    edit do
      field :email do
        label 'Email'
      end
      field :phone
      field :first_name
      field :last_name
      field :avatar
      field :zipcode
      field :money_transfer_destination
      field :level
      field :points
      field :about_me
      field :accept_terms
      field :accept_emails
      field :feedbacks
      
      field :password
      field :password_confirmation
    end
  end
end
