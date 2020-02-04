# frozen_string_literal: true

module BrazeRuby
  module REST
    class SendMessages < Base
      attr_reader :api_key, :messages, :external_user_ids

      def initialize(api_key, braze_url, options, messages: [], external_user_ids: [])
        @api_key = api_key
        @messages = messages
        @external_user_ids = external_user_ids
        super braze_url, options
      end

      def perform
        http.post '/messages/send', {
          'api_key':           api_key,
          'messages':          messages,
          'external_user_ids': external_user_ids
        }
      end
    end
  end
end
