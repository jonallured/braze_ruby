require 'spec_helper'

describe 'list segments' do
  subject(:list_segments) { api.list_segments }

  context 'with success', :vcr do
    it 'responds with success' do
      expect(list_segments).to be_success
    end

    it 'responds with a list of segments' do
      expect(segments.count).to be 13
    end

    def segments
      JSON.parse(list_segments.body)['segments']
    end
  end
end
