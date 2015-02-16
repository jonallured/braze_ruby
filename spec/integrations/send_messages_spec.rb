require 'spec_helper'

describe 'send messages' do
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
    let(:group_id) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(send_messages.status).to be 401
    end
  end
end
