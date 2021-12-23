# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteTriggerCampaignSchedule < Base
      def perform(campaign_id:, schedule_id:)
        http.post(
          "/campaigns/trigger/schedule/delete",
          campaign_id: campaign_id,
          schedule_id: schedule_id
        )
      end
    end
  end
end
