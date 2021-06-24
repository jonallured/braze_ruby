# frozen_string_literal: true

require "spec_helper"

describe "remove email addresses from spam" do
  subject(:remove_from_spam) do
    api.remove_emails_from_spam(email: ["thing@beep.com", "crash@bandicoot.net"])
  end

  context "with success", :vcr do
    it "responds with created" do
      expect(remove_from_spam).to be_success
    end

    it "responds with success message" do
      expect(JSON.parse(remove_from_spam.body)).to eq(
        "message" => "success"
      )
    end
  end

  context "unauthorized", :vcr do
    let(:api_key) { "non-existent" }

    it "responds with unauthorized" do
      expect(remove_from_spam.status).to be 401
    end
  end
end
