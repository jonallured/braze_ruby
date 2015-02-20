module Appboy
  module REST
    class TrackUsers < Base
      def perform(app_group_id, attributes: [], events: [], purchases: [])
        http.post '/users/track', {
          app_group_id:   app_group_id,
          attributes:     attributes,
          events:         events,
          purchases:      purchases
        }
      end
    end
  end
end
