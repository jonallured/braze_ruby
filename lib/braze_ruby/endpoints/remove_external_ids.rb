# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RemoveExternalIds
      attr_writer :remove_external_ids_service

      def remove_external_ids(**payload)
        remove_external_ids_service.perform(**payload)
      end

      private

      def remove_external_ids_service
        @remove_external_ids ||= BrazeRuby::REST::RemoveExternalIds.new(api_key, braze_url, options)
      end
    end
  end
end
