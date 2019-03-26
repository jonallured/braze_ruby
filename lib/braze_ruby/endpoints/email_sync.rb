module BrazeRuby
  module Endpoints
    module EmailSync
      def email_unsubscribes(**payload)
        BrazeRuby::REST::EmailUnsubscribes.new(api_key, braze_url, payload).perform
      end

      def email_hard_bounces(**payload)
        BrazeRuby::REST::EmailHardBounces.new(api_key, braze_url, payload).perform
      end
    end
  end
end
