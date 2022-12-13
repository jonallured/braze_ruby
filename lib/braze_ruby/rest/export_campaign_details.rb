# frozen_string_literal: true

module BrazeRuby
  module REST
    class ExportCampaignDetails < Base
      def perform(options)
        http.get("/campaigns/details", options)
      end
    end
  end
end
