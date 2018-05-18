module BrazeRuby
  module Endpoints
    module DeleteUsers
      attr_writer :delete_users_service

      def delete_users_action(**payload)
        delete_users_service.perform(api_key, payload)
      end

      def delete_users(payload)
        delete_users_action(external_ids: payload.compact.uniq)
      end

      private

      def delete_users_service
        @delete_users_service ||= BrazeRuby::REST::DeleteUsers.new(braze_url)
      end
    end
  end
end
