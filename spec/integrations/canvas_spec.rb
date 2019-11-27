# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'canvas' do
  describe 'trigger_send' do
    it 'sends a canvas', vcr: true do
      response = api.trigger_canvas_send(
        canvas_id: 'dc23ade4-e970-0c52-81bc-b369f64f533d',
        recipients: [
          external_user_id: 132404,
          canvas_entry_properties: {first_name: 'John'}
        ]
      )
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
