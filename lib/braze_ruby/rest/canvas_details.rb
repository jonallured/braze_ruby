# frozen_string_literal: true

module BrazeRuby
  module REST
    class CanvasDetails < Base
      attr_reader :params

      def initialize(api_key, braze_url, options, **params)
        @params = params
        super api_key, braze_url, options
      end

      def perform
        http.get("/canvas/details", {
          **@params
        })
      end
    end
  end
end
