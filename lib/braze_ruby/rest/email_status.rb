# frozen_string_literal: true

module BrazeRuby
  module REST
    class EmailStatus < Base
      attr_reader :api_key, :email, :status

      def initialize(api_key, braze_url, options, email: nil, status: nil)
        @api_key = api_key
        @email = email
        @status = status
        super braze_url, options
      end

      def perform
        http.post '/email/status', {
          'api_key': api_key,
          'email': email,
          'subscription_state': status
        }
      end
    end
  end
end
