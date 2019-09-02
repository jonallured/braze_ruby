module BrazeRuby
  module Endpoints
    module Campaigns
      def trigger_campaign_send(**payload)
        BrazeRuby::REST::TriggerCampaignSend.new(api_key, braze_url, payload).perform
      end
    end
  end
end
