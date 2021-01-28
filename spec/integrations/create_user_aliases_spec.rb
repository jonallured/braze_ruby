# frozen_string_literal: true

require 'spec_helper'

describe 'create user aliases' do
  let(:user) { { user_alias: { alias_name: 'abc', alias_label: 'foo' } } }

  subject(:create_user_aliases) do
    api.create_user_aliases(user_aliases: [user])
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(create_user_aliases.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(create_user_aliases.body)).to eq(
        'aliases_processed' => 1,
        'message' => 'success'
      )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(create_user_aliases.status).to be 401
    end
  end
end
