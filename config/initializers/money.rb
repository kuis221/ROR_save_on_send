MoneyRails.configure do |config|
  # set the default currency
  config.default_currency = :usd

  # FIXME remove hardcoded exchange rate when we'll implement getting rate 
  # from online service
  config.add_rate 'USD', 'CNY', 6.12
  config.add_rate 'USD', 'INR', 61.40
  config.add_rate 'USD', 'MXN', 13.61
  config.add_rate 'USD', 'PHP', 45.01
end
