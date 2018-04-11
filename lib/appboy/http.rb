module Appboy
  class HTTP
    def post(path, payload)
      connection.post path do |request|
        request.body = payload
      end
    end

    def get(path, query)
      connection.get path, query
    end

    def connection
      @connection ||= Faraday.new(url: 'https://rest.iad-03.braze.com') do |connection|
        connection.request :json

        connection.response :logger if ENV['APPBOY_DEBUG']

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
