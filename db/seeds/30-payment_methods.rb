[
  ['cash', 'efectivo', 'cash'], 
  ['bank account', 'cuenta bancaria', 'bank'], 
  ['plastic card', 'tarjeta de plástico', 'card']
].each do |name, name_es, slug|
  PaymentMethod.find_or_initialize_by(slug: slug)
    .update_attributes(name: name, name_es: name_es)
end
