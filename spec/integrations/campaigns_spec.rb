require 'spec_helper'

RSpec.describe 'campaigns' do
  describe 'trigger_send' do
    it 'sends an email', vcr: true do
      response = api.trigger_campaign_send(
        campaign_id: '69e9b681-779c-4b4c-b6b8-cd74b17d21d2',
        recipients: [
          external_user_id: 132404,
          trigger_properties: {first_name: 'John'}
        ]
      )
    end
  end
end
