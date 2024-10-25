# frozen_string_literal: true

module BrazeRuby
  module REST
    class SendMessages < Base
      attr_reader :messages, :external_user_ids

      def initialize(api_key, braze_url, options, messages: [], external_user_ids: [])
        @messages = messages
        @external_user_ids = external_user_ids
        super(api_key, braze_url, options)
      end

      def perform
        http.post "/messages/send", {
          messages: messages,
          external_user_ids: external_user_ids
        }
      end
    end
  end
end
