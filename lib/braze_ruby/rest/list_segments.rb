# frozen_string_literal: true

module BrazeRuby
  module REST
    class ListSegments < Base
      def perform
        http.get '/segments/list'
      end
    end
  end
end
