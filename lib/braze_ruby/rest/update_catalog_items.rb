# frozen_string_literal: true

module BrazeRuby
  module REST
    class UpdateCatalogItems < Base
      attr_reader :params
      attr_reader :catalog_name

      def initialize(api_key, braze_url, options, catalog_name, **params)
        @catalog_name = catalog_name
        @params = params
        super(api_key, braze_url, options)
      end

      def perform
        http.put("/catalogs/#{@catalog_name}/items", @params)
      end
    end
  end
end
