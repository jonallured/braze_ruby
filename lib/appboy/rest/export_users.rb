module Appboy
  module REST
    class ExportUsers < Base
      def perform(app_group_id, external_ids: nil, segment_id: nil, **options)
        return export_users_by_ids(app_group_id, external_ids) if external_ids

        export_users_by_segment(app_group_id, segment_id, options) if segment_id
      end

      private

      def export_users_by_ids(app_group_id, external_ids)
        http.post '/users/export/ids', {
          app_group_id: app_group_id,
          external_ids: external_ids
        }
      end

      def export_users_by_segment(app_group_id, segment_id, options)
        http.post '/users/export/segment', {
          app_group_id: app_group_id,
          segment_id: segment_id
        }.merge(options)
      end
    end
  end
end
