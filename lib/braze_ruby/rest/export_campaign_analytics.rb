# frozen_string_literal: true

module BrazeRuby
  module REST
    class ExportCampaignAnalytics < Base
      def perform(options)
        http.get("/campaigns/data_series", options)
      end
    end
  end
end
