# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ScheduledBroadcasts do
  let(:http) { double(:http) }

  let(:end_time) { Time.now.iso8601 }

  let(:payload) do
    {
      end_time: :end_time
    }
  end

  subject { described_class.new(:api_key, :rest_url, {}, **payload) }

  before { subject.http = http }

  it "makes an http call to the scheduled broadcasts endpoint" do
    expect(http).to receive(:post).with "/messages/scheduled_broadcasts", payload

    subject.perform
  end
end
