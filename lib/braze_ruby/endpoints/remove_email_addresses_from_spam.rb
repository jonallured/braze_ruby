# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RemoveEmailAddressesFromSpam
      attr_writer :remove_emails_from_spam_rest

      def remove_emails_from_spam(**payload)
        remove_emails_from_spam_rest.perform(**payload)
      end

      private

      def remove_emails_from_spam_rest
        @remove_emails_from_spam_rest ||= BrazeRuby::REST::RemoveEmailAddressesFromSpam.new(api_key, braze_url, options)
      end
    end
  end
end
