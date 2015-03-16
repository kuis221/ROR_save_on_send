# == Schema Information
#
# Table name: user_recent_transactions
#
#  id                                  :integer          not null, primary key
#  user_id                             :integer
#  date                                :date
#  amount_sent_cents                   :integer          default(0), not null
#  amount_received_cents               :integer          default(0), not null
#  originating_source_of_funds_id      :integer
#  service_provider_id                 :integer
#  destination_preference_for_funds_id :integer
#  fees_for_receiving                  :string(255)
#  send_to_receive_duration            :integer
#  documentation_requirements          :string(255)
#  promotion                           :string(255)
#  service_quality                     :integer
#  comments                            :text
#  created_at                          :datetime
#  updated_at                          :datetime
#  currency                            :string(3)
#  fees_for_sending_cents              :integer          default(0), not null
#  money_transfer_destination_id       :integer
#  send_to_receive_duration_interval   :string(255)
#

class User::RecentTransaction < ActiveRecord::Base
  DURATION_INTERVALS = %w{minutes hours days}

  REQUIRED_FIELDS = %i{date currency amount_sent_cents amount_received_cents originating_source_of_funds service_provider
    destination_preference_for_funds fees_for_sending send_to_receive_duration feedback}

  validates_presence_of REQUIRED_FIELDS
  validates_numericality_of :amount_sent, :amount_received, greater_than: 0
  validates_presence_of :money_transfer_destination, if: :anonymous?

  belongs_to :user
  belongs_to :service_provider

  belongs_to :originating_source_of_funds, class_name: PaymentMethod
  belongs_to :destination_preference_for_funds, class_name: PaymentMethod

  belongs_to :service_provider, inverse_of: :recent_transactions

  belongs_to :money_transfer_destination, class_name: Country

  has_one :feedback, as: :commendable
  
  monetize :amount_sent_cents
  monetize :amount_received_cents, with_model_currency: :currency
  monetize :fees_for_sending_cents

  # Use model level currency
  register_currency :usd

  accepts_nested_attributes_for :service_provider, reject_if: proc { |attrs| attrs[:name].blank? }
  accepts_nested_attributes_for :feedback

  def send_to_receive_duration_with_interval
    "#{send_to_receive_duration} #{send_to_receive_duration_interval}"
  end

  def total_cost(fx_markup = 0)
    return if invalid?

    if currency == 'USD'
      fees_for_sending + amount_sent - amount_received
    else
      fx_markup_rate = fx_markup != 0 ? 1 - fx_markup.fdiv(100) : 1
      FXRate.convert(date: date, to_currency: currency, amount: (fees_for_sending + amount_sent))*fx_markup_rate - amount_received
    end
  end

  def self.duration_intervals_for_select
    locale = I18n.locale
    User::RecentTransaction::DURATION_INTERVALS.collect do |interval| 
      interval_id = interval

      interval_text = if locale == :en
                        interval
                      elsif locale == :es
                        I18n.t("datetime.prompts.#{interval.singularize}").pluralize.downcase
                      elsif locale == :'zh-CN'
                        I18n.t("datetime.prompts.#{interval.singularize}")
                      end

      [interval_text, interval_id]
    end
  end

  protected
  def anonymous?
    user.nil?
  end

  rails_admin do
    list do
      field :user
      field :date
      field :amount_sent
      field :amount_received
      field :currency
      field :fees_for_sending
      field :originating_source_of_funds
      field :destination_preference_for_funds
      field :money_transfer_destination
      field :service_provider
      field :send_to_receive_duration_with_interval
      field :created_at
    end

    show do
      field :user
      field :date
      field :amount_sent
      field :amount_received
      field :currency
      field :fees_for_sending
      field :originating_source_of_funds
      field :destination_preference_for_funds
      field :money_transfer_destination
      field :service_provider
      field :send_to_receive_duration_with_interval
      field :created_at
    end

    edit do
      field :user
      field :date
      field :amount_sent
      field :amount_received
      field :currency
      field :fees_for_sending
      field :originating_source_of_funds
      field :destination_preference_for_funds
      field :money_transfer_destination
      field :service_provider do
        nested_form false
      end
      field :send_to_receive_duration
      field :send_to_receive_duration_interval
      field :created_at
    end
  end
end
