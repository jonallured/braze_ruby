# frozen_string_literal: true

module BrazeRuby
  module REST
    class ListCatalogs < Base
      def perform
        http.get("/catalogs")
      end
    end
  end
end
