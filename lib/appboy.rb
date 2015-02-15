require 'json'
require 'virtus'
require 'faraday'

require 'appboy/version'
require 'appboy/connection'
require 'appboy/purchase'

module Appboy
  autoload :API, 'appboy/api'
end
