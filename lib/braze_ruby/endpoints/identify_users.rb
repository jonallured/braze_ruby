# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module IdentifyUsers
      attr_writer :identify_users_rest

      def identify_users(**payload)
        identify_users_rest.perform(**payload)
      end

      private

      def identify_users_rest
        @identify_users_rest ||= BrazeRuby::REST::IdentifyUsers.new(api_key, braze_url, options)
      end
    end
  end
end
