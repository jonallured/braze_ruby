# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'canvas' do
  describe 'trigger_send' do
    it 'sends a canvas', vcr: true do
      response = api.trigger_canvas_send(
        canvas_id: '70a7fb99-cbcb-451a-8224-5f8b8c63e03f',
        recipients: [
          external_user_id: 12345,
          canvas_entry_properties: {first_name: 'John'}
        ]
      )

      expect(response.success?).to eq(true)
    end
  end

  describe 'details' do
    it 'returns error when no canvas', vcr: true do
      response = api.canvas_details(
        canvas_id: 'non-existing'
      )
      expect(response.status).to eq(400)
    end
  end
end
