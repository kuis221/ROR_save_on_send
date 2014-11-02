# countries

%w{China India Mexico Philippines}.each do |country|
  Country.find_or_create_by(name: country)
end
