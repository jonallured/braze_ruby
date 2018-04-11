require 'active_support/concern'

module Integrations
  extend ActiveSupport::Concern

  included do
    let(:api_key) { ENV.fetch('APPBOY_GROUP_ID') }
    let(:segment_id) { ENV.fetch('APPBOY_TEST_SEGMENT') }

    let(:api) { Appboy::API.new(api_key) }



  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
