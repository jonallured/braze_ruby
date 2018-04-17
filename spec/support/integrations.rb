require 'active_support/concern'

module Integrations
  extend ActiveSupport::Concern

  included do
    let(:api_key) { ENV.fetch('BRAZE_REST_API_KEY') }
    let(:rest_url) { ENV.fetch('BRAZE_REST_URL')}
    let(:segment_id) { ENV.fetch('BRAZE_RUBY_TEST_SEGMENT') }

    let(:api) { BrazeRuby::API.new(api_key, rest_url) }



  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
