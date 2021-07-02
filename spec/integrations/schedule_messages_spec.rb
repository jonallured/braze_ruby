# frozen_string_literal: true

require "spec_helper"

describe "schedule messages" do
  let(:user_ids) { [12345] }
  let(:test_time) { "2020-08-07T00:00:00+02:00" }
  let(:messages) { build(:messages) }

  subject(:schedule_messages) do
    api.schedule_messages(
      time: test_time, messages: messages, external_user_ids: user_ids
    )
  end

  context "with success", vcr: true do
    it "responds with created" do
      expect(schedule_messages.status).to be 201
    end

    it "responds with success message" do
      expect(JSON.parse(schedule_messages.body)).to include(
        "message" => "success"
      )
    end
  end

  context "unauthorized", vcr: true do
    let(:api_key) { "non-existent" }

    it "responds with unauthorize" do
      expect(schedule_messages.status).to be 401
    end
  end
end
