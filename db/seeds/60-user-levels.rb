[
  ['Bronze user', 'bronze'],
  ['Silver user', 'silver'], 
  ['Gold user', 'gold']
].each do |name, slug|
  User::Level.find_or_initialize_by(slug: slug)
    .update_attributes(name: name)
end
