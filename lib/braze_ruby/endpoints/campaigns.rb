# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Campaigns
      def trigger_campaign_send(**payload)
        BrazeRuby::REST::TriggerCampaignSend.new(api_key, braze_url, options, payload).perform
      end
    end
  end
end
