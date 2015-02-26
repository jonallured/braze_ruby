module Appboy
  module REST
    class ExportUsers < Base
      def perform(app_group_id, external_ids:)
        http.post '/users/export/ids', {
          app_group_id: app_group_id,
          external_ids: external_ids
        }
      end
    end
  end
end
