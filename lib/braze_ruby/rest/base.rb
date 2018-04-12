require 'braze_ruby/http'

module BrazeRuby
  module REST
    class Base
      attr_writer :http

      def initialize(braze_url)
        @braze_url = braze_url
      end

      private

      def http
        @http ||= BrazeRuby::HTTP.new(@braze_url)
      end
    end
  end
end
