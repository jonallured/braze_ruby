# frozen_string_literal: true

module BrazeRuby
  module REST
    class RemoveExternalIds < Base
      def perform(external_ids: [])
        http.post '/users/external_ids/remove', {
          'external_ids': external_ids
        }
      end
    end
  end
end
