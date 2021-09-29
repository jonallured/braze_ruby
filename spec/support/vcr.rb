# frozen_string_literal: true

require "vcr"

VCR.configure do |config|
  config.filter_sensitive_data("<BRAZE_REST_API_KEY>") { braze_rest_api_key }
  config.filter_sensitive_data("<BRAZE_REST_URL>") { braze_rest_url }

  config.cassette_library_dir = "spec/fixtures/responses"

  config.default_cassette_options = {
    match_requests_on: [:method, :uri, :body],
    record: :once,
    allow_unused_http_interactions: false
  }

  config.configure_rspec_metadata!

  config.hook_into :webmock
end
