# frozen_string_literal: true

module BrazeRuby
  module REST
    class SubscriptionStatusGet < Base
      attr_reader :params

      def initialize(api_key, braze_url, options, **params)
        @params = params
        super api_key, braze_url, options
      end

      def perform
        http.get('/subscription/status/get', {
          **params
        })
      end
    end
  end
end
