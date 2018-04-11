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
      @connection ||= 'https://rest.iad-03.braze.com' do |connection|
        connection.request :json

        connection.response :logger if ENV['APPBOY_DEBUG']
      end
    end
  end
end
