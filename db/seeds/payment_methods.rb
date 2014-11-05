['cash', 'plastic card', 'bank account'].each do |name|
  PaymentMethod.find_or_create_by(name: name)
end
