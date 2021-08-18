# frozen_string_literal: true

module BrazeRuby
  module REST
    class RemoveHardBounceFlag < Base
      def perform(email: [])
        http.post "/email/bounce/remove", {
          email: email
        }
      end
    end
  end
end
