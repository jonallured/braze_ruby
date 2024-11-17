# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RenameExternalIds
      attr_writer :rename_external_ids_rest

      def rename_external_ids(payload)
        rename_external_ids_rest.perform(external_id_renames: payload[:external_id_renames])
      end

      private

      def rename_external_ids_rest
        @rename_external_ids_rest ||= BrazeRuby::REST::RenameExternalIds.new(api_key, braze_url, options)
      end
    end
  end
end
