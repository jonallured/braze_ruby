require 'pry'
require 'dotenv'
require 'bundler/setup'

Bundler.setup
Dotenv.load

require 'braze_ruby'
require 'support/vcr'
require 'support/factory_bot'
require 'support/integrations'

RSpec.configure do |config|
  def test_time
    Time.parse('2019-02-15 00:00:00 -0500')
  end

  def braze_rest_api_key
    ENV.fetch('BRAZE_REST_API_KEY', 'test')
  end

  def braze_rest_url
    ENV.fetch('BRAZE_REST_URL', 'https://rest.iad-03.braze.com')
  end

  def braze_test_segment
    'a8fde797-4c44-4406-8e6c-5850d323f169'
  end
end
