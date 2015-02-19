require 'active_support/concern'

module Integrations
  extend ActiveSupport::Concern

  included do
    let(:app_group_id) { ENV.fetch('APPBOY_GROUP_ID') }
    let(:segment_id) { ENV.fetch('APPBOY_TEST_SEGMENT') }

    let(:api) { Appboy::API.new(app_group_id) }



  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
