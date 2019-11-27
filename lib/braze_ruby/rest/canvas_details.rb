# frozen_string_literal: true

module BrazeRuby
  module REST
    class CanvasDetails < Base
      attr_reader :api_key, :params

      def initialize(api_key, braze_url, **params)
        @api_key = api_key
        @params = params
        super braze_url
      end

      def perform
        http.get('/canvas/details', {
          'api_key': api_key,
          **@params
        })
      end
    end
  end
end
