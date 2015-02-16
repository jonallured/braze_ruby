require 'spec_helper'

describe 'track users' do
  let(:attributes) do
    [
      {
        external_id: 1,
        foo: :bar
      }
    ]
  end

  let(:events) do
    [
      {
        external_id: 1,
        name: :baz,
        time: Time.now
      }
    ]
  end

  let(:purchases) do
    [
      {
        external_id: 1,
        product_id: 1,
        time: Time.now,
        currency: 'CAD',
        price: 1.0
      }
    ]
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

  context 'with failure', vcr: true do
    let(:group_id) { 'non-existent' }

    it 'responds with a unauthorized' do
      expect(track_users.status).to be 401
    end
  end
end
