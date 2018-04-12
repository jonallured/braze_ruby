module BrazeRuby
  class HTTP
    def initialize(braze_url)
      @braze_url = braze_url
    end

    def post(path, payload)
      connection.post path do |request|
        request.body = payload
      end
    end

    def get(path, query)
      connection.get path, query
    end

    def connection
      @connection ||= Faraday.new(url: @braze_url) do |connection|
        connection.request :json

        connection.response :logger if ENV['BRAZE_RUBY_DEBUG']

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
