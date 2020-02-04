# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::ExportUsers do
  let(:http) { double(:http) }

  let(:payload) {{ external_ids: external_ids }}
  let(:external_ids) { [1] }

  subject { described_class.new :rest_url, {} }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/export/ids',
        payload.merge({ api_key: :api_key })

    subject.perform(:api_key, payload)
  end
end
