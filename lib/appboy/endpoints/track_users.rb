module Appboy
  module Endpoints
    module TrackUsers
      def track_users(**payload)
        track_users_service.new(app_group_id, payload).perform
      end

      private

      def track_users_service
        Appboy::REST::TrackUsers
      end
    end
  end
end
