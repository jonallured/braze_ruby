# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module ContentBlocks
      attr_writer :content_blocks_service

      def list_content_blocks
        content_blocks_service.perform
      end

      private

      def content_blocks_service
        @content_blocks_service ||= BrazeRuby::REST::ContentBlocks.new(api_key, braze_url, options)
      end
    end
  end
end
