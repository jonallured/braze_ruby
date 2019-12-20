# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module IdentifyUsers
      attr_writer :identify_users_service

      def identify_users(**payload)
        identify_users_service.perform(api_key, payload)
      end

      private

      def identify_users_service
        @identify_users_service ||= BrazeRuby::REST::IdentifyUsers.new(braze_url)
      end
    end
  end
end
