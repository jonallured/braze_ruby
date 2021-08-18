# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::RemoveHardBounceFlag do
  let(:http) { double(:http) }

  let(:payload) { {email: ["fake@fake.net", "real_email22@cool.org"]} }

  let(:api_key) { :api_key }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the remove user from spam list endpoint" do
    expect(http).to receive(:post).with "/email/bounce/remove",
      payload

    subject.perform(**payload)
  end
end
