require 'spec_helper'

describe Appboy::REST::ExportUsers do
  let(:http) { double(:http) }

  let(:payload) {{ external_ids: :external_ids }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/export/ids',
        payload.merge({ app_group_id: :app_group_id })

    subject.perform(app_group_id, payload)
  end
end
