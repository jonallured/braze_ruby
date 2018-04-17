require 'json'
require 'virtus'
require 'braze_ruby/version'

module BrazeRuby
  autoload :API, 'braze_ruby/api'
  autoload :REST, 'braze_ruby/rest'
  autoload :Endpoints, 'braze_ruby/endpoints'
end
