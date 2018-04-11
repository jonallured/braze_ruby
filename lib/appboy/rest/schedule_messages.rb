module Appboy
  module REST
    class ScheduleMessages < Base
      attr_reader :api_key, :send_at, :messages, :segment_id, :local_timezone

      def initialize(api_key, send_at:, messages: [], segment_id: nil, local_timezone: false)
        @api_key = api_key
        @send_at = send_at
        @messages = messages
        @segment_id = segment_id
        @local_timezone = local_timezone
      end

      def perform
        http.post '/messages/schedule', {
          api_key:      api_key,
          segment_ids:               [segment_id],
          send_at:                   send_at,
          deliver_in_local_timezone: local_timezone,
          messages:                  messages
        }
      end
    end
  end
end
