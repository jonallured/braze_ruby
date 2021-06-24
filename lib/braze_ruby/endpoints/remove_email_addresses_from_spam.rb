# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RemoveEmailAddressesFromSpam
      attr_writer :remove_emails_from_spam_service

      def remove_emails_from_spam(**payload)
        remove_emails_from_spam_service.perform(**payload)
      end

      private

      def remove_emails_from_spam_service
        @remove_emails_from_spam_service ||= BrazeRuby::REST::RemoveEmailAddressesFromSpam.new(api_key, braze_url, options)
      end
    end
  end
end
