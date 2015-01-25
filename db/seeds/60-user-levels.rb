[
  ['Silver user', 'silver'], 
  ['Golden user', 'golden']
].each do |name, slug|
  User::Level.find_or_initialize_by(slug: slug)
    .update_attributes(name: name)
end
