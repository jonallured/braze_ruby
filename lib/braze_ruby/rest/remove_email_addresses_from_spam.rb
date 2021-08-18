# frozen_string_literal: true

module BrazeRuby
  module REST
    class RemoveEmailAddressesFromSpam < Base
      def perform(email: [])
        http.post "/email/spam/remove", {
          email: email
        }
      end
    end
  end
end
