module Appboy
  class API
    def initialize(secret, app_group_id)
      @secret, @app_group_id = secret, app_group_id
    end

    def track(attributes)
      payload = {company_secret: @secret,
                 app_group_id: @app_group_id,
                 attributes: attributes}

      response = self.class.post('/users/track', query: payload)
      response['message'] == 'success'
    end
  end
end
