# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module TrackUsers
      attr_writer :track_users_service

      def track_users(**payload)
        track_users_service.perform(payload)
      end

      def track_purchase(payload)
        track_users(purchases: [payload])
      end

      def track_event(payload)
        track_users(events: [payload])
      end

      def track_attribute(payload)
        track_users(attributes: [payload])
      end

      private

      def track_users_service
        @track_users_service ||= BrazeRuby::REST::TrackUsers.new(api_key, braze_url, options)
      end
    end
  end
end
