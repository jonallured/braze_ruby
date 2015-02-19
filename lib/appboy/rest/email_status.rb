module Appboy
  module REST
    class EmailStatus < Base
      attr_reader :app_group_id, :email, :status

      def initialize(app_group_id, email:, status:)
        @app_group_id = app_group_id
        @email = email
        @status = status
      end

      def perform
        http.post '/email/status', {
          app_group_id: app_group_id,
          email: email,
          subscription_state: status
        }
      end
    end
  end
end
