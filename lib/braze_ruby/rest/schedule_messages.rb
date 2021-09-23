# frozen_string_literal: true

module BrazeRuby
  module REST
    class ScheduleMessages < Base
      attr_reader :time, :messages, :in_local_time, :external_user_ids, :campaign_id

      def initialize(api_key, braze_url, options, time: nil, messages: [], external_user_ids: [], in_local_time: false, campaign_id: nil)
        @messages = messages
        @time = time
        @external_user_ids = external_user_ids
        @in_local_time = in_local_time
        @campaign_id = campaign_id
        super api_key, braze_url, options
      end

      def perform
        http.post "/messages/schedule/create", {
          external_user_ids: external_user_ids,
          campaign_id: campaign_id,
          schedule: {
            time: time,
            in_local_time: in_local_time
          },
          messages: messages
        }
      end
    end
  end
end
