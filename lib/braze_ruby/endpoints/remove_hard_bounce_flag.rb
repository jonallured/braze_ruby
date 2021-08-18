# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module RemoveHardBounceFlag
      attr_writer :remove_hard_bounce_flag_service

      def remove_hard_bounce_flag(**payload)
        remove_hard_bounce_flag.perform(**payload)
      end

      private

      def remove_hard_bounce_flag_service
        @remove_hard_bounce_flag_service ||= BrazeRuby::REST::RemoveHardBounceFlag.new(api_key, braze_url, options)
      end
    end
  end
end
