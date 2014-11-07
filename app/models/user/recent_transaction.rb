class User::RecentTransaction < ActiveRecord::Base
  DURATION_INTERVALS = %w{minutes hours days}

  belongs_to :user
  belongs_to :service_provider

  belongs_to :originating_source_of_funds, class_name: PaymentMethod
  belongs_to :destination_preference_for_funds, class_name: PaymentMethod

  belongs_to :service_provider
  
  monetize :amount_sent_cents
  monetize :amount_received_cents, with_model_currency: :currency

  # Use model level currency
  register_currency :usd

  attr_accessor :send_to_receive_duration_interval

  def send_to_receive_duration=(duration)
    if DURATION_INTERVALS.include?(send_to_receive_duration_interval)
      super(duration.to_i.send(send_to_receive_duration_interval))
    else
      super(duration)
    end
  end

  def send_to_receive_duration
    if send_to_receive_duration_interval.blank?
      duration_in_seconds = super
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
      super
    end
  end
end
