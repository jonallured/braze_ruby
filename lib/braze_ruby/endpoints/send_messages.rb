module BrazeRuby
  module Endpoints
    module SendMessages
      def send_messages(**payload)
        send_messages_service.new(api_key, braze_url, payload).perform
      end

      private

      def send_messages_service
        BrazeRuby::REST::SendMessages
      end
    end
  end
end
