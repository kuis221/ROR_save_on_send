[
  ['Western Union', 'western-union', 'https://www.westernunion.com/us/en/home.html', 'https://www.westernunion.com/us/en/price-estimator/start.html'],
  ['Xoom', 'xoom', 'https://www.xoom.com', 'https://www.xoom.com/send/getstarted#!recipient'],
  ['MoneyGram','moneygram', 'http://www.moneygram.com/us/en', 'https://m.moneygram.com/mgomobile/site/costEstimator.html'],
  ['Transfast', 'transfast', 'https://www.transfast.com', 'https://www.transfast.com'],
  ['Ria', 'ria', 'https://www.riamoneytransfer.com', 'https://www.riamoneytransfer.com/price-calculator'],
  ['Transferwise', 'transferwise','https://transferwise.com', 'https://transferwise.com/request/placeOrder?execution=e1s2'],
  ['Remitly', 'remitly', 'https://www.remitly.com', 'https://www.remitly.com'],
  ['WellsFargo', 'wellsfargo', 'https://www.wellsfargo.com', 'https://www.wellsfargo.com/international-remittances/cost-estimator'],
  ['Viamericas', 'viamericas', 'https://www.viamericas.com', 'https://www.viamericas.com/CustomerDirect/compareprices'],
  ['PNB', 'pnb', 'https://pnbwebremit.com', 'https://pnbwebremit.com/Index.aspx'],
  ['BofA', 'bofa', 'https://www.bankofamerica.com', 'https://www.bankofamerica.com/foreign-exchange/wire-transfer.go'],
  ['PayPal', 'paypal', 'https://www.paypal.com/home', 'https://www.paypal.com/us/cgi-bin/webscr?cmd=xpt/Marketing_CommandDriven/general/International_Money_Transfer-outside'],
  ['WalMart', 'walmart', 'https://walmart.moneygram.com', 'https://walmart.moneygram.com/MGOWap/flows/home?execution=e1s1#costEstimator'],
  ['ICICI', 'icici', 'http://www.icicibank.com', 'http://www.icicibank.com/nri-banking/money_transfer/money-transfer-rates.page?'],
  ['IndusInd', 'indusind', 'https://www.indusfastremit.com', 'https://www.indusfastremit.com/']
].each do |provider_attrs|
  service_provider = ServiceProvider.find_or_create_by(name: provider_attrs[0])
  service_provider.update_attributes(slug: provider_attrs[1], money_transfer_page: provider_attrs[3], landing_page: provider_attrs[2], created_by: Admin.first)
end
