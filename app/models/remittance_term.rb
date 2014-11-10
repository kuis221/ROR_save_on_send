class RemittanceTerm < ActiveRecord::Base
  belongs_to :receive_country, class_name: Country
  belongs_to :service_provider
  belongs_to :send_method, class_name: PaymentMethod
  belongs_to :receive_method, class_name: PaymentMethod

  monetize :fees_for_sending_cents

  # Use model level currency
  register_currency :usd
  
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
      send_method = PaymentMethod.find_by(slug: data['Send method'])
      next if send_method.nil?

      # Receive method
      receive_method = PaymentMethod.find_by(slug: data['Receive method'])
      next if receive_method.nil?

      remittance_term_attrs = {
        receive_country: receive_country, 
        service_provider: service_provider,
        send_method: send_method,
        receive_method: receive_method,
        receive_currency: data['Receive currency'],
        send_amount_range_from: data['Send amount range ($USD) From'].gsub(',', '_'),
        send_amount_range_to: data['Send amount range ($USD) To'].gsub(',', '_'),
        fees_for_sending: data['Fees for sending USD'],
        fees_for_sending_percent: data['Fees for sending %'],
        fx_markup: data['FX markup (%)'],
        duration: data['Duration (hours)'],
        documentation: data['Documentation'],
        promotions: data['Promotions'],
        service_quality: data['Service quality']
      }

      RemittanceTerm.create(remittance_term_attrs)
    end
  end
end
