# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module SendMessages
      def send_messages(**payload)
        send_messages_service.new(api_key, braze_url, options, payload).perform
      end

      private

      def send_messages_service
        BrazeRuby::REST::SendMessages
      end
    end
  end
end
