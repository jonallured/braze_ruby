require 'appboy/http'

module Appboy
  module REST
    class Base
      attr_writer :http

      private

      def http
        @http ||= Appboy::HTTP.new
      end
    end
  end
end
