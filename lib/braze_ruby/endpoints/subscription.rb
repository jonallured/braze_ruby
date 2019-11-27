# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Subscription
      def subscription_status_set(**payload)
        BrazeRuby::REST::SubscriptionStatusSet.new(api_key, braze_url, payload).perform
      end

      def subscription_status_get(**payload)
        BrazeRuby::REST::SubscriptionStatusGet.new(api_key, braze_url, payload).perform
      end


      def subscription_user_status(**payload)
        BrazeRuby::REST::SubscriptionUserStatus.new(api_key, braze_url, payload).perform
      end
    end
  end
end
