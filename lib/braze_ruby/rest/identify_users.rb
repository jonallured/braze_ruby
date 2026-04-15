# frozen_string_literal: true

module BrazeRuby
  module REST
    class IdentifyUsers < Base
      def perform(aliases_to_identify: [], emails_to_identify: [], phone_numbers_to_identify: [])
        payload = {}
        payload[:aliases_to_identify] = aliases_to_identify if aliases_to_identify.any?
        payload[:emails_to_identify] = emails_to_identify if emails_to_identify.any?
        payload[:phone_numbers_to_identify] = phone_numbers_to_identify if phone_numbers_to_identify.any?
        http.post "/users/identify", payload
      end
    end
  end
end
