module BrazeRuby
  module REST
    class ScheduleMessages < Base
      attr_reader :api_key, :time, :messages, :segment_id, :in_local_time

      def initialize(api_key, braze_url, time: nil, messages: [], segment_id: nil, in_local_time: false)
        @api_key = api_key
        @messages = messages
        @segment_id = segment_id
        @time = time
        @in_local_timezone = in_local_time
        super braze_url
      end

      def perform
        http.post '/messages/schedule', {
          'api_key':                    api_key,
          'segment_id':                 segment_id,
          'schedule': {
            'time':                       time,
            'in_local_time':              in_local_time
          },
          'messages':                   messages
        }
      end
    end
  end
end
