class RemittanceTerm < ActiveRecord::Base
  belongs_to :receive_country, class_name: Country
  belongs_to :service_provider
  belongs_to :send_method, class_name: PaymentMethod
  belongs_to :receive_method, class_name: PaymentMethod

  monetize :fees_for_sending_cents

  # Use model level currency
  register_currency :usd

  attr_accessor :highlight

  def send_amount_with_fee(amount)
    amount_with_fee = amount + fees_for_sending
    amount_with_fee += (amount*fees_for_sending_percent)/100 if fees_for_sending_percent > 0
    amount_with_fee
  end

  def all_fees(amount)
    fees_for_sending_cents.fdiv(amount.cents)*100 + fees_for_sending_percent + fx_markup
  end

  def estimated_receive_amount(amount, currency)
    amount = amount.exchange_to(currency)
    amount - amount*fx_markup/100.0
  end

  def estimated_send_amount(amount, currency)
    amount = (amount + amount*fx_markup/100.0).exchange_to('USD')
    Money.new(amount + fees_for_sending + amount*fees_for_sending_percent/100.0)
  end

  def transaction_cost(amount, currency)
    cost = 0

    if expense > 0
      cost = Money.new(amount*expense/100, 'USD')
      cost = cost.exchange_to(receive_currency) if currency != 'USD'
    end

    cost
  end

  def highlight?
    !!highlight
  end

  def self.least_expensive(amount_send: nil, amount_receive: nil, receive_country: nil, receive_currency: nil, send_method: nil, receive_method: nil)
    return if (amount_send == 0 && amount_receive == 0) || receive_country.nil? || receive_currency.nil?

    amount =  if amount_send > 0 
                amount_send 
              else
                amount_receive.exchange_to('USD')
              end

    order_by = ['expense']

    # same as all_fees
    select_query = %Q{*, (fees_for_sending_cents::FLOAT/#{amount.cents}*100 + 
                          fees_for_sending_percent + fx_markup) as expense}

    if send_method && receive_method
      select_query += %Q{
        , (send_method_id = #{send_method.id} AND receive_method_id = #{receive_method.id}) 
        as same_methods 
      }

      order_by += ['same_methods DESC']
    end

    least_expensive_services = RemittanceTerm.where(receive_country: receive_country, 
                         receive_currency: receive_currency)
                  .where("#{amount.to_i} >= send_amount_range_from AND " +
                         "#{amount.to_i} <= send_amount_range_to")
                  .select(select_query)
                  .order(order_by)

    if send_method && receive_method
      filtered_least_expensive_services = least_expensive_services.to_a 
     
      if filtered_least_expensive_services.first.present? &&
          (filtered_least_expensive_services.first.send_method != send_method ||
          filtered_least_expensive_services.first.receive_method != receive_method)

        filtered_least_expensive_services.first.highlight = true
      end

      filtered_least_expensive_services.to_a.keep_if do |item| 
        (item == least_expensive_services.first) ||
        (item.send_method == send_method && item.receive_method == receive_method)
      end
    else
      least_expensive_services
    end
  end

  def self.save_on_transaction(transaction)
    saving = 0

    amount_send = transaction.amount_sent
    receive_currency = transaction.currency
    receive_country = transaction.user.money_transfer_destination 

    least_expensive_service = least_expensive(amount_send: amount_send, 
                                      receive_country: receive_country, 
                                      receive_currency: receive_currency).first
   
    if least_expensive_service
      fx_markup = least_expensive_service.fx_markup
      saving = transaction.total_cost(fx_markup) -
        least_expensive_service.transaction_cost(amount_send, receive_currency)
    end

    saving > 0 ? saving : 0
  end
  
  def self.import_from_csv(csv_path = nil)
    csv_file = csv_path.nil? ? Rails.root.join('db/seeds', 'remittance_terms.csv') : open(csv_path)

    events = CSV.read(csv_file, headers: :first_row)

    events.each do |data|
      # Receive country
      receive_country = Country.find_by(name: data['Receive country'])
      next if receive_country.nil?

      # Remit name
      service_provider = ServiceProvider.find_by(name: data['Remit name'])
      next if service_provider.nil?

      # Send method
      send_method = PaymentMethod.find_by(slug: data['Sending type'])
      next if send_method.nil?

      # Receive method
      receive_methods = data['Receiving type'].split(',')
      receive_methods.map!{|receive_method_slug| PaymentMethod.find_by(slug: receive_method_slug.strip)}.delete_if(&:nil?)
      next if receive_methods.empty?

      receive_methods.each do |receive_method|
        remittance_term_attrs = {
          receive_country: receive_country, 
          service_provider: service_provider,
          send_method: send_method,
          receive_method: receive_method,
          receive_currency: data['To which currency?'],
          send_amount_range_from: data['Send amount range ($USD) - From'].gsub(',', '_'),
          send_amount_range_to: data['Send amount range ($USD) - To'].gsub(',', '_'),
          fees_for_sending: data['Fees for sending - USD'] || 0,
          fees_for_sending_percent: data['Fees for sending - %'] || 0,
          fx_markup: data['FX markup'] || 0,
          duration: data['Send-to-receive - Duration (hours)'],
          documentation: data['Documentation requirements'],
          promotions: data['Promotions'],
          service_quality: data['Service quality']
        }

        RemittanceTerm.create(remittance_term_attrs)
      end
    end
  end
end
