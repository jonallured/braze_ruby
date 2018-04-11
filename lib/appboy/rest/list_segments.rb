module Appboy
  module REST
    class ListSegments < Base
      def perform(api_key)
        http.get '/segments/list', {
          api_key: api_key
        }
      end
    end
  end
end
