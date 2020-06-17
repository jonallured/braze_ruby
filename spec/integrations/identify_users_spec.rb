# frozen_string_literal: true

require 'spec_helper'

describe 'identify users' do
  let(:user) { { external_id: 12345, user_alias: { alias_name: 'abc', alias_label: 'foo' } } }

  subject(:identify_users) do
    api.identify_users(aliases_to_identify: [user])
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(identify_users.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(identify_users.body)).to eq(
          'aliases_processed' => 1,
          'message' => 'success'
        )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(identify_users.status).to be 401
    end
  end
end
