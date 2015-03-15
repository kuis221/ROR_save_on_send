# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( noscript.css )
Rails.application.config.assets.precompile += %w( locale/locale_en.css )
Rails.application.config.assets.precompile += %w( locale/locale_es.css )
Rails.application.config.assets.precompile += %w( locale/locale_zh-CN.css )