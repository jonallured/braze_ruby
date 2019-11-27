# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module EmailStatus
      def email_status(**payload)
        email_status_service.new(api_key, braze_url, payload).perform
      end

      def email_status_service
        BrazeRuby::REST::EmailStatus
      end
    end
  end
end
