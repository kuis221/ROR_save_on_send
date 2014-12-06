[
  ['cash', 'cash'], 
  ['bank account', 'bank'], 
  ['plastic card', 'card']
].each do |name, slug|
  PaymentMethod.find_or_initialize_by(slug: slug)
    .update_attributes(name: name)
end
