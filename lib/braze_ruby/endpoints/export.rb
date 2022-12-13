# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Export
      def export_campaigns_list(**payload)
        BrazeRuby::REST::ExportCampaignsList.new(api_key, braze_url, options).perform(**payload)
      end

      def export_campaign_details(**payload)
        BrazeRuby::REST::ExportCampaignDetails.new(api_key, braze_url, options).perform(**payload)
      end

      def export_campaign_analytics(**payload)
        BrazeRuby::REST::ExportCampaignAnalytics.new(api_key, braze_url, options).perform(**payload)
      end
    end
  end
end
