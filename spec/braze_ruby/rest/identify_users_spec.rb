# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::IdentifyUsers do
  let(:http) { double(:http) }

  let(:payload) { {aliases_to_identify: [user]} }
  let(:user) { { external_id: 123, user_alias: { alias_name: 'abc', alias_label: 'foo' } } }

  let(:api_key) { :api_key }

  subject { described_class.new :rest_url, {}}

  before { subject.http = http }

  it 'makes an http call to the identify users endpoint' do
    expect(http).to receive(:post).with '/users/identify',
        payload.merge({ api_key: :api_key })

    subject.perform(api_key, payload)
  end
end
