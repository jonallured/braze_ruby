# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::V2SubscriptionStatusSet do
  let(:http) { double(:http) }

  let(:payload) do
    {
      subscription_groups: [
        {
          subscription_group_id: "TEST",
          subscription_state: "subscribed",
          emails: ["fake@fake.net"]
        }
      ]
    }
  end

  subject { described_class.new :api_key, :rest_url, {}, **payload }

  before { subject.http = http }

  it "makes an http call to add users to the subscription groups v2 endpoint" do
    expect(http).to receive(:post).with "/v2/subscription/status/set", payload

    subject.perform
  end
end
