{'cash' => 'cash', 'bank account' => 'bank', 'plastic card' => 'card'}.each do |name, slug|
  PaymentMethod.create_with(name: name).find_or_create_by(slug: slug)
end
