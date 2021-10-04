# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module ScheduleMessages
      def schedule_messages(**payload)
        BrazeRuby::REST::ScheduleMessages.new(api_key, braze_url, options, **payload).perform
      end

      def scheduled_messages(**payload)
        BrazeRuby::REST::ScheduledBroadcasts.new(api_key, braze_url, options, **payload).perform
      end
    end
  end
end
