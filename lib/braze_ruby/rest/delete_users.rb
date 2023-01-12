# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteUsers < Base
      def perform(external_ids: [], user_aliases: [], braze_ids: [])
        http.post "/users/delete", {
          external_ids: external_ids,
          user_aliases: user_aliases,
          braze_ids: braze_ids,
        }
      end
    end
  end
end
