# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::RemoveExternalIds do
  let(:http) { double(:http) }

  let(:payload) { {external_ids: ["foo"]} }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the remove external ids endpoint" do
    expect(http).to receive(:post).with "/users/external_ids/remove", payload

    subject.perform(**payload)
  end
end
