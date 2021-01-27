# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module CreateUserAliases
      attr_writer :create_user_aliases_service

      def create_user_aliases(**payload)
        create_user_aliases_service.perform(**payload)
      end

      private

      def create_user_aliases_service
        @create_user_aliases_service ||= BrazeRuby::REST::CreateUserAliases.new(api_key, braze_url, options)
      end
    end
  end
end
