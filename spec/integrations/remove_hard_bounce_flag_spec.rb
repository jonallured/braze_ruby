# frozen_string_literal: true

require "spec_helper"

describe "remove hard bounce flag from user email" do
  subject(:remove_hard_bounce) do
    api.remove_hard_bounce_flag(email: ["thing@beep.com", "crash@bandicoot.net"])
  end

  context "with success", :vcr do
    it "responds with created" do
      expect(remove_hard_bounce).to be_success
    end

    it "responds with success message" do
      expect(JSON.parse(remove_hard_bounce.body)).to eq(
        "message" => "success"
      )
    end
  end

  context "unauthorized", :vcr do
    let(:api_key) { "non-existent" }

    it "responds with unauthorized" do
      expect(remove_hard_bounce.status).to be 401
    end
  end
end
