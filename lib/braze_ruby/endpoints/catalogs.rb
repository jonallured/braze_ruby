# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Catalogs
      # Catalog management
      def create_catalogs(**payload)
        BrazeRuby::REST::CreateCatalogs.new(api_key, braze_url, options, **payload).perform
      end

      def delete_catalog(catalog_name)
        BrazeRuby::REST::DeleteCatalog.new(api_key, braze_url, options, catalog_name).perform
      end

      def list_catalogs
        BrazeRuby::REST::ListCatalogs.new(api_key, braze_url, options).perform
      end

      # Catalog items
      def create_catalog_items(catalog_name, **payload)
        BrazeRuby::REST::CreateCatalogItems.new(api_key, braze_url, options, catalog_name, **payload).perform
      end

      def delete_catalog_items(catalog_name, **payload)
        BrazeRuby::REST::DeleteCatalogItems.new(api_key, braze_url, options, catalog_name, **payload).perform
      end

      def update_catalog_items(catalog_name, **payload)
        BrazeRuby::REST::UpdateCatalogItems.new(api_key, braze_url, options, catalog_name, **payload).perform
      end

      def edit_catalog_items(catalog_name, **payload)
        BrazeRuby::REST::EditCatalogItems.new(api_key, braze_url, options, catalog_name, **payload).perform
      end
    end
  end
end
