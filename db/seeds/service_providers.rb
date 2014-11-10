[
  'Western Union', 
  'Xoom', 
  'MoneyGram', 
  'Transfast', 
  'Ria', 
  'Transferwise', 
  'Remitly', 
  'WellsFargo',
  'Viamericas',
  'PNB',
  'BofA',
  'PayPal'
].each do |name|
  ServiceProvider.find_or_create_by(name: name)
end
