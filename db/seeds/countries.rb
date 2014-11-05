# countries

{
  'China'=>'CNY', 
  'India' => 'INR', 
  'Mexico' => 'MXN',
  'Philippines' => 'PHP'}.each do |country_name, currency_code|
    (Country.where(name: country_name).first || Country.new)
      .update_attributes(name: country_name, currency_code: currency_code)
end
