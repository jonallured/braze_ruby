# frozen_string_literal: true

module BrazeRuby
  module REST
    class ContentBlocks < Base
      def perform
        http.get "/content_blocks/list"
      end
    end
  end
end
