# frozen_string_literal: true

require "bundler/setup"
require "pry"
require "dotenv"

Dotenv.load

require "braze_ruby"
require "support/vcr"
require "support/factory_bot"
require "support/integrations"

RSpec.configure do |config|
  config.before(:all) do
    BrazeRuby.configure do |config|
      config.rest_api_key = ENV.fetch("BRAZE_REST_API_KEY", "test")
      config.rest_url = ENV.fetch("BRAZE_REST_URL", "https://rest.iad-03.braze.com")
    end
  end

  def braze_rest_api_key
    BrazeRuby.configuration.rest_api_key
  end

  def braze_rest_url
    BrazeRuby.configuration.rest_url
  end
end
