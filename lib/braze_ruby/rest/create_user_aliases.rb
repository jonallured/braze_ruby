# frozen_string_literal: true

module BrazeRuby
  module REST
    class CreateUserAliases < Base
      def perform(user_aliases: [])
        http.post "/users/alias/new", {
          user_aliases: user_aliases
        }
      end
    end
  end
end
