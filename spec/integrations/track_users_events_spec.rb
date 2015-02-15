require 'spec_helper'

describe 'track users events' do
  let(:events) { [{ external_id: 1, name: :baz, time: Time.now }] }

  context 'with success', vcr: true do
    it 'responds with 201 created' do
      expect(track_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(track_users.body)).to eq(
          'events_processed' => 1,
          'message' => 'success'
        )
    end
  end

  context 'wrong group id', vcr: true do
    let(:group_id) { 'non-existent' }

    it 'responds with a 401' do
      expect(track_users.status).to be 401
    end
  end
end
