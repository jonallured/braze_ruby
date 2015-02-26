require 'spec_helper'

describe 'export users' do
  subject(:export_users) do
    api.export_users(external_ids: [1])
  end

  context 'with success', vcr: true do
    it 'responds with created' do
      expect(export_users.status).to be 201
    end
  end

  context 'unauthorized' do

  end
end
