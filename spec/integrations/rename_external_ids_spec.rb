# frozen_string_literal: true

require 'spec_helper'

describe 'rename external ids' do
  let(:external_id_renames) { { external_id_renames: [{ current_external_id: 'abc', new_external_id: 'foo' }] } }

  subject(:rename_external_ids) do
    api.rename_external_ids(external_id_renames)
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(rename_external_ids.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(rename_external_ids.body)).to include(
                                                        'external_ids' => [
                                                          hash_including(
                                                            'current_external_id' => 'abc',
                                                            'new_external_id' => 'foo'
                                                          ),],
                                                        'rename_errors' => [],
                                                        'message' => 'success'
                                                      )
    end
  end

  context 'unauthorized', vcr: true do
    let(:api_key) { 'non-existent' }

    it 'responds with unauthorized' do
      expect(rename_external_ids.status).to be 401
    end
  end
end
