# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module DeleteUsers
      attr_writer :delete_users_rest

      def delete_users_action(**payload)
        delete_users_rest.perform(**payload)
      end

      def delete_users(payload)
        delete_users_action(external_ids: payload.compact.uniq)
      end

      private

      def delete_users_rest
        @delete_users_rest ||= BrazeRuby::REST::DeleteUsers.new(api_key, braze_url, options)
      end
    end
  end
end
