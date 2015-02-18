require 'spec_helper'

describe Appboy::REST::TrackUsers do
  let(:http) { double(:http) }

  let(:payload) {{
    attributes: :attributes,
    events: :events,
    purchases: :purchases
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id, payload) }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/track',
        payload.merge({ app_group_id: :app_group_id })

    subject.perform
  end
end
