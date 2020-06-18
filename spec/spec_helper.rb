# frozen_string_literal: true

require 'bundler/setup'
require 'pry'
require 'dotenv'

Dotenv.load

require 'braze_ruby'
require 'support/vcr'
require 'support/factory_bot'
require 'support/integrations'

BRAZE_REST_API_KEY = ENV.fetch('BRAZE_REST_API_KEY', 'test')
BRAZE_REST_URL = ENV.fetch('BRAZE_REST_URL', 'https://rest.iad-03.braze.com')

RSpec.configure do |config|
  def braze_rest_api_key
    BRAZE_REST_API_KEY
  end

  def braze_rest_url
    BRAZE_REST_URL
  end
end
