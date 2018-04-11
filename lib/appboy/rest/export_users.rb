module Appboy
  module REST
    class ExportUsers < Base
      def perform(api_key, external_ids: nil, segment_id: nil, **options)
        return export_users_by_ids(api_key, external_ids) if external_ids

        export_users_by_segment(api_key, segment_id, options) if segment_id
      end

      private

      def export_users_by_ids(api_key, external_ids)
        http.post '/users/export/ids', {
          api_key: api_key,
          external_ids: external_ids
        }
      end

      def export_users_by_segment(api_key, segment_id, options)
        http.post '/users/export/segment', {
          api_key: api_key,
          segment_id: segment_id
        }.merge(options)
      end
    end
  end
end
