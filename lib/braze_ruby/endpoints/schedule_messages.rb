module BrazeRuby
  module Endpoints
    module ScheduleMessages
      def schedule_messages(**payload)
        schedule_messages_service.new(api_key, braze_url, payload).perform
      end

      private

      def schedule_messages_service
        BrazeRuby::REST::ScheduleMessages
      end
    end
  end
end
