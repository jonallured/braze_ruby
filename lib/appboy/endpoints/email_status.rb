module Appboy
  module Endpoints
    module EmailStatus
      def email_status(**payload)
        email_status_service.new(api_key, payload).perform
      end

      def email_status_service
        Appboy::REST::EmailStatus
      end
    end
  end
end
