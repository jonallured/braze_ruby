module Appboy
  module REST
    class ListSegments < Base
      def perform(app_group_id)
        http.get '/segments/list', {
          app_group_id: app_group_id
        }
      end
    end
  end
end
