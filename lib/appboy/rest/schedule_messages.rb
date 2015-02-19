module Appboy
  module REST
    class ScheduleMessages < Base
      attr_reader :app_group_id, :send_at, :messages, :segment_id, :local_timezone

      def initialize(app_group_id, send_at:, messages: [], segment_id: nil, local_timezone: false)
        @app_group_id = app_group_id
        @send_at = send_at
        @messages = messages
        @segment_id = segment_id
        @local_timezone = local_timezone
      end

      def perform
        http.post '/messages/schedule', {
          app_group_id:      app_group_id,
          segment_ids:               [segment_id],
          send_at:                   send_at,
          deliver_in_local_timezone: local_timezone,
          messages:                  messages
        }
      end
    end
  end
end
