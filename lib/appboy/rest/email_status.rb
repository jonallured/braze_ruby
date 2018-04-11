module Appboy
  module REST
    class EmailStatus < Base
      attr_reader :api_key, :email, :status

      def initialize(api_key, email:, status:)
        @api_key = api_key
        @email = email
        @status = status
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
