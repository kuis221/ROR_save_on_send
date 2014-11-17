[
  ['Western Union', 'https://www.westernunion.com/us/en/price-estimator/start.html'],
  ['Xoom', 'https://www.xoom.com/send/getstarted#!recipient'],
  ['MoneyGram', 'https://m.moneygram.com/mgomobile/site/costEstimator.html'],
  ['Transfast', 'https://www.transfast.com/send-money-to-india'],
  ['Ria', 'https://www.riamoneytransfer.com/price-calculator'],
  ['Transferwise', 'https://transferwise.com/request/placeOrder?execution=e1s2'],
  ['Remitly', 'https://www.remitly.com/help/view/87'],
  ['WellsFargo', 'https://www.wellsfargo.com/international-remittances/cost-estimator'],
  ['Viamericas', 'https://www.viamericas.com/CustomerDirect/compareprices'],
  ['PNB', 'https://pnbwebremit.com/Fees.aspx'],
  ['BofA', 'https://www.bankofamerica.com/foreign-exchange/wire-transfer.go'],
  ['PayPal', 'https://www.paypal.com/us/cgi-bin/webscr?cmd=xpt/Marketing_CommandDriven/general/International_Money_Transfer-outside'],
  ['WalMart', 'https://walmart.moneygram.com/MGOWap/flows/home?execution=e1s1#costEstimator']
].each do |provider_attrs|
  service_provider = ServiceProvider.find_or_create_by(name: provider_attrs[0])
  service_provider.update_attribute(:landing_page, provider_attrs[1])
end
