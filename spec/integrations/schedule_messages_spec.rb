require 'spec_helper'

describe 'schedule messages' do
  let(:user_ids) { [1] }
  let(:messages) { build(:messages) }

  subject(:schedule_messages) do
    api.schedule_messages(send_at: test_time,
      messages: messages, segment_id: segment_id)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(schedule_messages.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(schedule_messages.body)).to eq(
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorize' do
      expect(schedule_messages.status).to be 401
    end
  end
end
