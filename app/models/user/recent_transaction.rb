class User::RecentTransaction < ActiveRecord::Base
  DURATION_INTERVALS = %w{minutes hours days}

  REQUIRED_FIELDS = %i{date currency amount_sent_cents amount_received_cents originating_source_of_funds service_provider
    destination_preference_for_funds fees_for_sending send_to_receive_duration feedback}

  validates_presence_of REQUIRED_FIELDS
  validates_numericality_of :amount_sent, :amount_received, greater_than: 0

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

  attr_accessor :send_to_receive_duration_interval

  def send_to_receive_duration=(duration)
    if DURATION_INTERVALS.include?(send_to_receive_duration_interval)
      super(duration.to_i.send(send_to_receive_duration_interval))
    else
      super(duration)
    end
  end

  def send_to_receive_duration
    duration_in_seconds = super
    
    if send_to_receive_duration_interval.blank? && duration_in_seconds.present?
      duration = duration_in_seconds

      if duration_in_seconds > 0
        duration_in_minutes = duration_in_seconds/60

        if duration_in_minutes < 60
          duration = duration_in_minutes
          self.send_to_receive_duration_interval = DURATION_INTERVALS[0]
        else
          duration_in_hours = duration_in_minutes/60
        
          if duration_in_hours < 24
            duration = duration_in_hours
            self.send_to_receive_duration_interval = DURATION_INTERVALS[1]
          else
            duration = duration_in_hours/24
            self.send_to_receive_duration_interval = DURATION_INTERVALS[2]
          end
        end
      end

      duration
    else
      duration_in_seconds
    end
  end

  def total_cost(fx_markup = 0)
    return if invalid?

    if currency == 'USD'
      fees_for_sending + amount_sent - amount_received
    else
      fx_markup_rate = fx_markup != 0 ? 1 - fx_markup.fdiv(100) : 1
      (fees_for_sending + amount_sent).exchange_to(currency)*fx_markup_rate - amount_received
    end
  end

  def self.duration_intervals_for_select
    User::RecentTransaction::DURATION_INTERVALS.collect do |interval| 
      interval_id = interval
      
      interval_text = if I18n == :en
                        interval
                      else
                        I18n.t("datetime.prompts.#{interval.singularize}").pluralize.downcase
                      end

      [interval_text, interval_id]
    end
  end
end
