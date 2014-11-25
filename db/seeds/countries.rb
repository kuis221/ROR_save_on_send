# countries

[
  ['China', 'China', 'CNY'], 
  ['India', 'India', 'INR'], 
  ['Mexico', 'México', 'MXN'],
  ['Philippines', 'Filipinas', 'PHP']
].each do |country_name, country_name_es, currency_code|
    (Country.where(name: country_name).first || Country.new)
      .update_attributes(name: country_name, name_es: country_name_es, currency_code: currency_code)
end
