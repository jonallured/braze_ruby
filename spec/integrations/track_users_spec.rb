require 'spec_helper'

describe 'track users' do
  let(:attributes) { [build(:attribute)] }
  let(:events) { [build(:event, time: test_time)] }
  let(:purchases) { [build(:purchase, time: test_time)] }

  subject(:track_users) do
    api.track_users(attributes: attributes,
      events: events, purchases: purchases)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(track_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(track_users.body)).to eq(
          'attributes_processed' => 1,
          'events_processed' => 1,
          'purchases_processed' => 1,
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(track_users.status).to be 401
    end
  end
end
