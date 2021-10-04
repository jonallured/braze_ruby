# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::EmailStatus do
  let(:http) { double(:http) }

  let(:payload) do
    {
      email: "notthere@example.com",
      status: "subscribed"
    }
  end

  def params_from(payload)
    {
      email: payload[:email],
      subscription_state: payload[:status]
    }
  end

  before { subject.http = http }

  subject { described_class.new(:api_key, :rest_url, {}, **payload) }

  it "makes an http call to the email status endpoint" do
    expect(http).to receive(:post).with "/email/status", params_from(payload)

    subject.perform
  end
end
