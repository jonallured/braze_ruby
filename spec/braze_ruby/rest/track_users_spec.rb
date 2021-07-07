# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::TrackUsers do
  let(:http) { double(:http) }

  let(:payload) do
    {
      attributes: :attributes,
      events: :events,
      purchases: :purchases
    }
  end

  let(:api_key) { :api_key }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the track user endpoint" do
    expect(http).to receive(:post).with "/users/track", payload

    subject.perform(**payload)
  end
end
