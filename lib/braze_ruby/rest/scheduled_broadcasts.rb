# frozen_string_literal: true

module BrazeRuby
  module REST
    class ScheduledBroadcasts < Base
      attr_reader :params

      def initialize(api_key, braze_url, options, **params)
        @params = params
        super(api_key, braze_url, options)
      end

      def perform
        http.post "/messages/scheduled_broadcasts", {
                    **@params
        }
      end
    end
  end
end
