# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteUsers < Base
      def perform(api_key, external_ids: [])
        http.post '/users/delete', {
          'api_key':        api_key,
          'external_ids':   external_ids
        }
      end
    end
  end
end
