# frozen_string_literal: true

module Integrations
  def api_key
    braze_rest_api_key
  end

  def rest_url
    braze_rest_url
  end

  def segment_id
    braze_test_segment
  end

  def options
    {}
  end

  def api
    BrazeRuby::API.new(api_key, rest_url, options)
  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
