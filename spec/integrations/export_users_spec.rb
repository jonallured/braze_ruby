require 'spec_helper'

describe 'export users' do
  context 'by ids' do
    subject(:export_users) { api.export_users(external_ids: [1]) }

    context 'with success', :vcr do
      it 'responds with created' do
        expect(export_users).to be_success
      end
    end
  end

  context 'by segment' do
    context 'with success', :vcr do
      let(:segment_id) { ENV.fetch('BRAZE_RUBY_TEST_SEGMENT') }

      subject(:export_users) do
        api.export_users(segment_id: segment_id, callback_endpoint: 'https://example.com')
      end

      it 'responds with created' do
        expect(export_users).to be_success
      end
    end
  end
end
