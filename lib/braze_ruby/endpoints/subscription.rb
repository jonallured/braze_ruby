module BrazeRuby
  module Endpoints
    module Subscription
      def subscription_status_set(**payload)
        BrazeRuby::REST::SubscriptionStatusSet.new(api_key, braze_url, payload).perform
      end

      def subscription_status_get(**payload)
        BrazeRuby::REST::SubscriptionStatusGet.new(api_key, braze_url, payload).perform
      end
    end
  end
end
