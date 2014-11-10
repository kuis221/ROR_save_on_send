{'cash' => 'cash', 'bank account' => 'bank'}.each do |name, slug|
  PaymentMethod.create_with(name: name).find_or_create_by(slug: slug)
end
