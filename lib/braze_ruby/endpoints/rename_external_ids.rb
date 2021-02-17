# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RenameExternalIds
      attr_writer :rename_external_ids_service

      def rename_external_ids(**payload)
        rename_external_ids_service.perform(**payload)
      end

      private

      def rename_external_ids_service
        @rename_external_ids ||= BrazeRuby::REST::RenameExternalIds.new(api_key, braze_url, options)
      end
    end
  end
end
