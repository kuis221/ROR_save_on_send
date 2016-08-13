# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# use Rack::ReverseProxy do # #   reverse_proxy /^\/blog(\/.*)$/, 'http://50.87.248.156/~saveons2$1# # end

run Rails.application
