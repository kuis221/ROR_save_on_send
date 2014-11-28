[
  ['Western Union', 'western-union', 'https://www.westernunion.com/us/en/price-estimator/start.html'],
  ['Xoom', 'xoom', 'https://www.xoom.com/send/getstarted#!recipient'],
  ['MoneyGram','moneygram', 'https://m.moneygram.com/mgomobile/site/costEstimator.html'],
  ['Transfast', 'transfast', 'https://www.transfast.com/send-money-to-india'],
  ['Ria', 'ria', 'https://www.riamoneytransfer.com/price-calculator'],
  ['Transferwise', 'transferwise', 'https://transferwise.com/request/placeOrder?execution=e1s2'],
  ['Remitly', 'remitly', 'https://www.remitly.com/help/view/87'],
  ['WellsFargo', 'wellsfargo', 'https://www.wellsfargo.com/international-remittances/cost-estimator'],
  ['Viamericas', 'viamericas', 'https://www.viamericas.com/CustomerDirect/compareprices'],
  ['PNB', 'pnb', 'https://pnbwebremit.com/Fees.aspx'],
  ['BofA', 'bofa', 'https://www.bankofamerica.com/foreign-exchange/wire-transfer.go'],
  ['PayPal', 'paypal', 'https://www.paypal.com/us/cgi-bin/webscr?cmd=xpt/Marketing_CommandDriven/general/International_Money_Transfer-outside'],
  ['WalMart', 'walmart', 'https://walmart.moneygram.com/MGOWap/flows/home?execution=e1s1#costEstimator']
].each do |provider_attrs|
  service_provider = ServiceProvider.find_or_create_by(name: provider_attrs[0])
  service_provider.update_attributes(slug: provider_attrs[1], landing_page: provider_attrs[2])
end
