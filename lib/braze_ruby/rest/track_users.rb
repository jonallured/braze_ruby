module BrazeRuby
  module REST
    class TrackUsers < Base
      def perform(api_key, attributes: [], events: [], purchases: [])
        http.post '/users/track', {
          'api_key':        api_key,
          'attributes':     attributes,
          'events':         events,
          'purchases':      purchases
        }
      end
    end
  end
end
