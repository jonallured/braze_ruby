# frozen_string_literal: true

module BrazeRuby
  module REST
    class ExportUsers < Base
      def perform(external_ids: nil, segment_id: nil, **options)
        return export_users_by_ids(external_ids) if external_ids

        export_users_by_segment(segment_id, options) if segment_id
      end

      private

      def export_users_by_ids(external_ids)
        http.post "/users/export/ids", {
          'external_ids': external_ids
        }
      end

      def export_users_by_segment(segment_id, options)
        http.post "/users/export/segment", {
          'segment_id': segment_id
        }.merge(options)
      end
    end
  end
end
