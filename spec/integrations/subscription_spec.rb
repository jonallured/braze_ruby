require 'spec_helper'

RSpec.describe 'subscription', vcr: true do
  let(:subscription_group_id) do
    '0201b87a-ef6e-4410-9412-a298c4c1206d'
  end
  let(:subscribed_user) { 'test-gem-001' }
  let(:unsubscribed_user) { 'test-gem-002' }
  let(:never_subscribed_user) { 'test-gem-003' }

  describe 'subscription_status_set' do
    subject(:response) do
      api.subscription_status_set(
        external_id: external_id,
        subscription_group_id: subscription_group_id,
        subscription_state: subscription_state
      )
    end

    let(:external_id) { subscribed_user }
    let(:subscription_state) { 'subscribed' }

    context 'when subscribing' do
      it 'subscribes the user' do
        expect(response.status).to eq(201)
      end
    end

    context 'when unsubscribing' do
      let(:external_id) { unsubscribed_user }
      let(:subscription_state) { 'unsubscribed' }

      before do
        api.subscription_status_set(
          external_id: external_id,
          subscription_group_id: subscription_group_id,
          subscription_state: 'subscribed'
        )
      end

      it 'unsubscribes the user' do
        expect(response.status).to eq(201)
      end
    end

    context 'when subscription group does not exist' do
      let(:subscription_group_id) { SecureRandom.uuid }

      it 'returns an error status' do
        expect(response.status).to eq(400)
      end
    end
  end
end
