# frozen_string_literal: true

require 'spec_helper'

describe 'remove external ids' do
  let(:external_ids) { { external_ids: ['foo'] } }

  subject(:remove_external_ids) do
    api.remove_external_ids(external_ids)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(remove_external_ids.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(remove_external_ids.body)).to include(
                                                        'removed_ids' => ['foo'],
                                                        'removal_errors' => [],
                                                        'message' => 'success'
                                                      )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(remove_external_ids.status).to be 401
    end
  end
end
