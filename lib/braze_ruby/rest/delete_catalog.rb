# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteCatalog < Base
      attr_reader :params

      def initialize(api_key, braze_url, options, catalog_name)
        @catalog_name = catalog_name
        super(api_key, braze_url, options)
      end

      def perform
        http.delete("/catalogs/#{@catalog_name}")
      end
    end
  end
end
