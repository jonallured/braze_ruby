module Appboy
  module Endpoints
    module SendMessages
      attr_writer :send_messages_service

      def send_messages(**payload)
        send_messages_service.new(app_group_id, payload).perform
      end

      private

      def send_messages_service
        Appboy::REST::SendMessages
      end
    end
  end
end
