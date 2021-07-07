# frozen_string_literal: true

module BrazeRuby
  module REST
    class RenameExternalIds < Base
      def perform(external_id_renames: [])
        http.post "/users/external_ids/rename", {
          external_id_renames: external_id_renames
        }
      end
    end
  end
end
