# frozen_string_literal: true

require "spec_helper"

describe "export users" do
  context "by ids" do
    subject(:export_users) { api.export_users(external_ids: [12345]) }

    context "with success", :vcr do
      it "responds with created" do
        expect(export_users).to be_success
      end
    end
  end

  context "by segment" do
    context "with success", :vcr do
      let(:segment_id) { "3aca937b-9bbc-4e42-9370-05e411967b2b" }

      subject(:export_users) do
        api.export_users(segment_id: segment_id, callback_endpoint: "https://example.com")
      end

      it "responds with created" do
        expect(export_users).to be_success
      end
    end
  end
end
