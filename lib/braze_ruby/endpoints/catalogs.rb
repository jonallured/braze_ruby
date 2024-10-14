# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Catalogs
      def create_catalog(**payload)
        BrazeRuby::REST::CreateCatalog.new(api_key, braze_url, options, **payload).perform
      end
    end
  end
end
