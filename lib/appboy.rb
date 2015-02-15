require 'json'
require 'virtus'
require 'faraday'
require 'faraday_middleware'

require 'appboy/version'

module Appboy
  autoload :API, 'appboy/api'
end
