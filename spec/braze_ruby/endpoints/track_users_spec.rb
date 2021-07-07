# frozen_string_literal: true

require "spec_helper"

class API
  include BrazeRuby::Endpoints::TrackUsers

  def api_key
    :api_key
  end
end

describe BrazeRuby::Endpoints::TrackUsers do
  let(:api) { API.new }
  let(:track_users_service) { double(:track_users_service) }

  before { api.track_users_service = track_users_service }

  describe "#track_users" do
    let(:payload) {
      {
        attributes: [build(:attribute)],
        events: [build(:event)],
        purchases: [build(:purchase)]
      }
    }

    subject(:track_users!) { api.track_users(**payload) }

    it "tracks attributes, events and purchases" do
      expect(track_users_service).to receive(:perform)
        .with(payload)

      track_users!
    end
  end

  describe "#track_purchase" do
    let(:payload) { build(:purchase) }

    subject(:track_purchase!) { api.track_purchase(**payload) }

    it "tracks a single purchase" do
      expect(track_users_service).to receive(:perform)
        .with(purchases: [payload])

      track_purchase!
    end
  end

  describe "#track_event" do
    let(:payload) { build(:event) }

    subject(:track_event!) { api.track_event(**payload) }

    it "tracks a single purchase" do
      expect(track_users_service).to receive(:perform)
        .with(events: [payload])

      track_event!
    end
  end

  describe "#track_attribute" do
    let(:payload) { build(:attribute) }

    subject(:track_attribute!) { api.track_attribute(**payload) }

    it "tracks a single purchase" do
      expect(track_users_service).to receive(:perform)
        .with(attributes: [payload])

      track_attribute!
    end
  end
end
