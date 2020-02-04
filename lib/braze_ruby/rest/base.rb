# frozen_string_literal: true

require 'braze_ruby/http'

module BrazeRuby
  module REST
    class Base
      attr_writer :http

      def initialize(braze_url, options)
        @braze_url = braze_url
        @options = options
      end

      private

      def http
        @http ||= BrazeRuby::HTTP.new(@braze_url, @options)
      end
    end
  end
end
