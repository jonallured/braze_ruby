# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module ScheduleMessages
      def schedule_messages(**payload)
        schedule_messages_service.new(api_key, braze_url, options, payload).perform
      end

      private

      def schedule_messages_service
        BrazeRuby::REST::ScheduleMessages
      end
    end
  end
end
