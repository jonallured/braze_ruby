# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module DeleteUsers
      attr_writer :delete_users_service

      def delete_users_action(**payload)
        delete_users_service.perform(**payload)
      end

      def delete_users(payload)
        delete_users_action(external_ids: payload.compact.uniq)
      end

      def delete_users_by_alias(payload)
        delete_users_action(user_aliases: payload.compact.uniq)
      end

      def delete_users_by_braze_id(payload)
        delete_users_action(braze_ids: payload.compact.uniq)
      end

      private

      def delete_users_service
        @delete_users_service ||= BrazeRuby::REST::DeleteUsers.new(api_key, braze_url, options)
      end
    end
  end
end
