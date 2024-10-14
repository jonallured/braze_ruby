# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Catalogs
      # Catalog management
      def create_catalog(**payload)
        BrazeRuby::REST::CreateCatalog.new(api_key, braze_url, options, **payload).perform
      end

      def delete_catalog(catalog_name)
        BrazeRuby::REST::DeleteCatalog.new(api_key, braze_url, options, catalog_name).perform
      end

      def list_catalogs
        BrazeRuby::REST::ListCatalogs.new(api_key, braze_url, options).perform
      end
    end
  end
end
