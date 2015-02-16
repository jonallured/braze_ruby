require 'spec_helper'

describe 'schedule messages' do
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
    let(:group_id) { 'non-existent' }

    it 'responds with unauthorize' do
      expect(schedule_messages.status).to be 401
    end
  end
end
