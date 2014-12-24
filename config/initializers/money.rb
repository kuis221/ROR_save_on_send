require 'money/bank/open_exchange_rates_bank'

if Rails.env.test?
  include WebMock::API

  fx_rates = File.read(Rails.root.join('spec/fixtures/files/fx_rates.cache'))

  stub_request(:get, "http://openexchangerates.org/latest.json?app_id=fc400af738024664b81700ce0d846a06").
    with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    to_return(status: 200, body: fx_rates, headers: {})
end

MoneyRails.configure do |config|
  # set the default currency
  config.default_currency = :usd

  # FIXME remove hardcoded exchange rate when we'll implement getting rate 
  # from online service
  #config.add_rate 'USD', 'CNY', 6.12
  #config.add_rate 'USD', 'INR', 61.40
  #config.add_rate 'USD', 'MXN', 13.61
  #config.add_rate 'USD', 'PHP', 45.01
  
  #config.add_rate 'CNY', 'USD', 0.163398
  #config.add_rate 'INR', 'USD', 0.016286
  #config.add_rate 'MXN', 'USD', 0.073475
  #config.add_rate 'PHP', 'USD', 0.022217
end

if ActiveRecord::Base.connection.table_exists?('fx_rates')
  moe = Money::Bank::OpenExchangeRatesBank.new

  moe.cache = Proc.new do |text| 
    if text.nil?
      FXRate.last.try(:text)
    else
      last_fx_rate = FXRate.last
      FXRate.create(text: text) if !last_fx_rate || (last_fx_rate && !last_fx_rate.created_at.today?)
    end
  end

  moe.app_id = 'fc400af738024664b81700ce0d846a06'
  moe.update_rates

  # set the seconds after than the current rates are automatically expired
  # by default, they never expire
  moe.ttl_in_seconds = 86400
  # Store in cache
  moe.save_rates

  Money.default_bank = moe
end
