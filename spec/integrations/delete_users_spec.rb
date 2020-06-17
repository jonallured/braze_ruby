# frozen_string_literal: true

require 'spec_helper'

describe 'delete users' do
  let(:external_ids) { [400, 401, 402] }

  subject(:delete_users) do
    api.delete_users(external_ids)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(delete_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(delete_users.body)).to include(
          'deleted' => 3,
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(delete_users.status).to be 401
    end
  end
end
