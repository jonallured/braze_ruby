# frozen_string_literal: true

require "spec_helper"

RSpec.describe "campaigns" do
  describe "trigger_send" do
    it "sends an email", vcr: true do
      response = api.trigger_campaign_send(
        campaign_id: "d8b73da7-0b7c-fc72-1d80-e59c7f20f0d3",
        recipients: [
          external_user_id: 12345,
          trigger_properties: {first_name: "John"}
        ]
      )

      expect(response.success?).to eq(true)
    end
  end
end
