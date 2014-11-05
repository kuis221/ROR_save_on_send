['Western Union', 'Xoom'].each do |name|
  ServiceProvider.find_or_create_by(name: name)
end
