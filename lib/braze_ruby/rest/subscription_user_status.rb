# frozen_string_literal: true

module BrazeRuby
  module REST
    class SubscriptionUserStatus < Base
      attr_reader :api_key, :params

      def initialize(api_key, braze_url, options, **params)
        @api_key = api_key
        @params = params
        super braze_url, options
      end

      def perform
        http.get('/subscription/user/status', {
          'api_key': api_key,
          **params
        })
      end
    end
  end
end
