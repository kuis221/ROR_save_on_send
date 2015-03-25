# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.saveonsend.com"

SitemapGenerator::Sitemap.create do
  add new_user_next_transfers_path
  add new_user_recent_transaction_path
  
  add new_user_registration_path
  add new_user_session_path

  ServiceProvider.find_each do |provider|
    add service_provider_path(provider), changefreq: 'daily'
  end

  add how_to_path
  add privacy_path
  add terms_path
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
