# frozen_string_literal: true

require "json"
require "faraday"

module BrazeRuby
  class HTTP
    DEFAULT_TIMEOUT = 30
    DEFAULT_OPEN_TIMEOUT = 5

    def initialize(api_key, braze_url, options = {})
      @api_key = api_key
      @braze_url = braze_url
      @options = default_options.merge(options)
    end

    def post(path, payload)
      connection.post path do |request|
        request.body = JSON.dump(payload)
      end
    end

    def get(path, query = {})
      connection.get path, query
    end

    def connection
      @connection ||= Faraday.new(url: @braze_url) do |connection|
        connection.headers["Content-Type"] = "application/json"
        connection.headers["Accept"] = "application/json"
        connection.headers["User-Agent"] = "Braze Ruby gem v#{BrazeRuby::VERSION}"
        connection.headers["Authorization"] = "Bearer #{@api_key}"

        connection.response :logger if ENV["BRAZE_RUBY_DEBUG"]

        connection.adapter Faraday.default_adapter

        connection.options[:timeout] = @options[:timeout]
        connection.options[:open_timeout] = @options[:open_timeout]
      end
    end

    private

    def default_options
      {timeout: DEFAULT_TIMEOUT, open_timeout: DEFAULT_OPEN_TIMEOUT}
    end
  end
end
