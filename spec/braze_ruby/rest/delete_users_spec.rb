# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::DeleteUsers do
  let(:http) { double(:http) }

  let(:payload) do
    {
      external_ids: [1, 2, 3],
      user_aliases: [4, 5, 6],
      braze_ids: [7, 8, 9],
    }
  end

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the delete user endpoint" do
    expect(http).to receive(:post).with "/users/delete", payload

    subject.perform(**payload)
  end
end
