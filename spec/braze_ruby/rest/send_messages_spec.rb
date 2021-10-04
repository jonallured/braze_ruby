# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::SendMessages do
  let(:http) { double(:http) }

  let(:payload) do
    {
      messages: ["message"],
      external_user_ids: ["1", "2"]
    }
  end

  subject { described_class.new(:api_key, :rest_url, {}, **payload) }

  before { subject.http = http }

  it "makes an http call to the send messages endpoint" do
    expect(http).to receive(:post).with "/messages/send", payload

    subject.perform
  end
end
