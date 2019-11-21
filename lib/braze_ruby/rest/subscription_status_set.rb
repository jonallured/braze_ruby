module BrazeRuby
  module REST
    class SubscriptionStatusSet < Base
      attr_reader :api_key, :params

      def initialize(api_key, braze_url, **params)
        @api_key = api_key
        @params = params
        super braze_url
      end

      def perform
        http.post('/subscription/status/set', {
          'api_key': api_key,
          **params
        })
      end
    end
  end
end
