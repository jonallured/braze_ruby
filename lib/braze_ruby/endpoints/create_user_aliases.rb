# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module CreateUserAliases
      attr_writer :create_user_aliases_rest

      def create_user_aliases(**payload)
        create_user_aliases_rest.perform(**payload)
      end

      private

      def create_user_aliases_rest
        @create_user_aliases_rest ||= BrazeRuby::REST::CreateUserAliases.new(api_key, braze_url, options)
      end
    end
  end
end
