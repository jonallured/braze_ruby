module Appboy
  module REST
    class TrackUsers < Base
      attr_reader :app_group_id, :attributes, :events, :purchases

      def initialize(app_group_id, attributes: [], events: [], purchases: [])
        @app_group_id = app_group_id
        @attributes = attributes
        @events = events
        @purchases = purchases
      end

      def perform
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
