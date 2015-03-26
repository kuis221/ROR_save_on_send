# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::ReverseProxy do  
  reverse_proxy /^\/blog(\/.*)$/, 'http://www.saveonsend.com/blog$1'
end

run Rails.application
