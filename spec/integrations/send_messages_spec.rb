require 'spec_helper'

describe 'send messages' do
  let(:user_ids) { [1] }
  let(:messages) { build(:messages) }

  subject(:send_messages) do
    api.send_messages(messages: messages, external_user_ids: user_ids)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(send_messages.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(send_messages.body)).to eq(
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(send_messages.status).to be 401
    end
  end
end
