# frozen_string_literal: true

module BrazeRuby
  module REST
    class ListCatalogs < Base
      def initialize(api_key, braze_url, options)
        super api_key, braze_url, options
      end

      def perform
        http.get("/catalogs")
      end
    end
  end
end
