require 'active_support/concern'

module Integrations
  extend ActiveSupport::Concern

  included do
    let(:api_key) { braze_rest_api_key }
    let(:rest_url) { braze_rest_url }
    let(:segment_id) { braze_test_segment }

    let(:api) { BrazeRuby::API.new(api_key, rest_url) }



  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
