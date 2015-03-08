include WebMock::API

fx_rates_23_09_2014 = File.read(Rails.root.join('spec/fixtures/files/fx_rates_23_09_2014.cache'))
fx_rates_03_11_2014 = File.read(Rails.root.join('spec/fixtures/files/fx_rates.cache'))

stub_request(:get, "http://openexchangerates.org/historical/2014-09-23.json?app_id=fc400af738024664b81700ce0d846a06").
  with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
  to_return(status: 200, body: fx_rates_23_09_2014, headers: {})


stub_request(:get, "http://openexchangerates.org/historical/2014-11-03.json?app_id=fc400af738024664b81700ce0d846a06").
  with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
  to_return(status: 200, body: fx_rates_03_11_2014, headers: {})


