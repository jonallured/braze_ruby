# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Campaigns
      def delete_campaign_trigger_schedule(**payload)
        BrazeRuby::REST::DeleteTriggerCampaignSchedule.new(api_key, braze_url, options).perform(**payload)
      end

      def trigger_campaign_send(**payload)
        BrazeRuby::REST::TriggerCampaignSend.new(api_key, braze_url, options, **payload).perform
      end

      def trigger_campaign_schedule(**payload)
        BrazeRuby::REST::TriggerCampaignSchedule.new(api_key, braze_url, options, **payload).perform
      end
    end
  end
end
