require 'braze_ruby/http'

module BrazeRuby
  module REST
    class Base
      attr_writer :http

      private

      def http
        @http ||= BrazeRuby::HTTP.new
      end
    end
  end
end
