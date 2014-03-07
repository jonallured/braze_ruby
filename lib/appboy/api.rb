module Appboy
  class API
    include HTTParty

    base_uri 'https://api.appboy.com'

    def initialize(secret, app_group_id)
      @secret, @app_group_id = secret, app_group_id
    end

    def track(attributes, events=[], purchases=[])
      post '/users/track', company_secret: @secret,
                           app_group_id:   @app_group_id,
                           attributes:     attributes,
                           events:         events,
                           purchases:      purchases
    end

    def send_message(message, user_ids, segment_ids = [])
      post '/messages/send', company_secret:    @secret,
                             app_group_id:      @app_group_id,
                             messages:          message,
                             external_user_ids: user_ids,
                             segment_ids:       segment_ids
    end

  private
    def post(url, payload)
      response = self.class.post(url, query: payload)
      puts response.inspect
      response['message'] == 'success'
    end
  end
end
