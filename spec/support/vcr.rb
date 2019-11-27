# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.filter_sensitive_data('<BRAZE_REST_API_KEY>') { BRAZE_REST_API_KEY }
  config.filter_sensitive_data('<BRAZE_REST_URL>') { BRAZE_REST_URL }

  config.cassette_library_dir = 'spec/fixtures/responses'

  config.default_cassette_options = {
    match_requests_on: [:method, :uri, :body]
  }

  config.configure_rspec_metadata!

  config.hook_into :webmock
end
