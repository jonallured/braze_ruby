module Appboy
  module Endpoints
    module TrackUsers
      attr_writer :track_users_service

      def track_users(**payload)
        track_users_service.perform(app_group_id, payload)
      end

      def track_purchase(**payload)
        track_users_service.perform(app_group_id, purchases: [payload])
      end

      def track_event(**payload)
        track_users_service.perform(app_group_id, events: [payload])
      end

      def track_attribute(**payload)
        track_users_service.perform(app_group_id, attributes: [payload])
      end

      private

      def track_users_service
        @track_users_service ||= Appboy::REST::TrackUsers.new
      end
    end
  end
end
