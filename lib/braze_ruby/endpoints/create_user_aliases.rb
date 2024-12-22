# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module CreateUserAliases
      def create_user_aliases(user_aliases: [])
        body = {user_aliases: user_aliases}
        http.post "/users/alias/new", body
      end
    end
  end
end
