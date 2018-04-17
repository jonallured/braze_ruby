module BrazeRuby
  module REST
    class ScheduleMessages < Base
      attr_reader :api_key, :time, :messages, :in_local_time, :external_user_ids

      def initialize(api_key, braze_url, time: nil, messages: [], external_user_ids: [], in_local_time: false)
        @api_key = api_key
        @messages = messages
        @time = time
        @external_user_ids = external_user_ids
        @in_local_time = in_local_time
        super braze_url
      end

      def perform
        http.post '/messages/schedule/create', {
          'api_key':                    api_key,
          'external_user_ids':          external_user_ids,
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
