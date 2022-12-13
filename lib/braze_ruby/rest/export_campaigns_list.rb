# frozen_string_literal: true

module BrazeRuby
  module REST
    class ExportCampaignsList < Base
      def perform(options)
        http.get("/campaigns/list", options)
      end
    end
  end
end
