# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Canvas
      def trigger_canvas_send(**payload)
        BrazeRuby::REST::TriggerCanvasSend.new(api_key, braze_url, options, payload).perform
      end

      def canvas_details(**payload)
        BrazeRuby::REST::CanvasDetails.new(api_key, braze_url, options, payload).perform
      end
    end
  end
end
