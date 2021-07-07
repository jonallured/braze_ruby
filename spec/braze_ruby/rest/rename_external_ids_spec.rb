# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::RenameExternalIds do
  let(:http) { double(:http) }

  let(:payload) { {external_id_renames: [{current_external_id: "abc", new_external_id: "foo"}]} }

  let(:api_key) { :api_key }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the rename external ids endpoint" do
    expect(http).to receive(:post).with "/users/external_ids/rename",
      payload

    subject.perform(**payload)
  end
end
