# frozen_string_literal: true

module BrazeRuby
  module REST
    class V2SubscriptionStatusSet < Base
      attr_reader :params

      def initialize(api_key, braze_url, options, **params)
        @params = params
        super(api_key, braze_url, options)
      end

      def perform
        http.post("/v2/subscription/status/set", {
          **params
        })
      end
    end
  end
end
