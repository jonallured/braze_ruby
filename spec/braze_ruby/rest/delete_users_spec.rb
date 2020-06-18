# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::DeleteUsers do
  let(:http) { double(:http) }

  let(:payload) { {external_ids: [1, 2, 3]} }

  let(:api_key) { :api_key }

  subject { described_class.new :api_key, :rest_url, {}}

  before { subject.http = http }

  it 'makes an http call to the delete user endpoint' do
    expect(http).to receive(:post).with '/users/delete',
        payload

    subject.perform(**payload)
  end
end
