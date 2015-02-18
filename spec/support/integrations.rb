require 'active_support/concern'

module Integrations
  extend ActiveSupport::Concern

  included do
    let(:group_id) { ENV.fetch('APPBOY_GROUP_ID') }

    let(:api) { Appboy::API.new(group_id) }

    let(:attributes) { Array.new }
    let(:events) { Array.new }
    let(:purchases) { Array.new }

    subject(:track_users) do
      api.track_users(
        attributes: attributes,
        events: events,
        purchases: purchases
      )
    end

    let(:messages) do
      {
        apple_push: {
          alert: :hello
        }
      }
    end

    let(:user_ids) { [1] }

    subject(:send_messages) do
      api.send_messages(
        messages: messages,
        external_user_ids: user_ids
      )
    end

    let(:segment_id) { :segment_id }

    subject(:schedule_messages) do
      api.schedule_messages(
        send_at: test_time,
        messages: messages,
        segment_id: ENV.fetch('APPBOY_TEST_SEGMENT')
      )
    end
  end

  RSpec.configure do |config|
    config.include self, type: :integrations, file_path: %r(spec/integrations)
  end
end
