# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ScheduledBroadcasts do
  let(:http) { double(:http) }
  let(:end_time) { Time.now.iso8601 }

  let(:payload) {
    {
      end_time: :end_time
    }
  }

  let(:api_key) { :api_key }

  subject { described_class.new(api_key, :rest_url, {}, **payload) }

  before { subject.http = http }

  it "makes an http call to the scheduled broadcasts endpoint" do
    expect_scheduled_broadcasts_http_call

    subject.perform
  end

  def expect_scheduled_broadcasts_http_call
    expect(http).to receive(:post).with "/messages/scheduled_broadcasts", {
      end_time: :end_time
    }
  end
end
