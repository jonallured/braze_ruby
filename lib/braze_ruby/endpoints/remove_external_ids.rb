# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RemoveExternalIds
      attr_writer :remove_external_ids_rest

      def remove_external_ids(payload)
        remove_external_ids_rest.perform(external_ids: payload[:external_ids])
      end

      private

      def remove_external_ids_rest
        @remove_external_ids_rest ||= BrazeRuby::REST::RemoveExternalIds.new(api_key, braze_url, options)
      end
    end
  end
end
