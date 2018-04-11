require 'spec_helper'

describe Appboy::REST::ExportUsers do
  let(:http) { double(:http) }

  let(:payload) {{ external_ids: :external_ids }}

  let(:api_key) { :api_key }

  subject { described_class.new }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/export/ids',
        payload.merge({ api_key: :api_key })

    subject.perform(api_key, payload)
  end
end
