# frozen_string_literal: true

module BrazeRuby
  module REST
    class EmailStatus < Base
      attr_reader :email, :status

      def initialize(api_key, braze_url, options, email: nil, status: nil)
        @email = email
        @status = status
        super api_key, braze_url, options
      end

      def perform
        http.post "/email/status", {
          'email': email,
          'subscription_state': status
        }
      end
    end
  end
end
