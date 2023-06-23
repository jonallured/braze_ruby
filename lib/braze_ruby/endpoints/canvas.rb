# frozen_string_literal: true

module BrazeRuby
  module Endpoints
    module Canvas
      def delete_canvas_trigger_schedule(**payload)
        BrazeRuby::REST::DeleteTriggerCanvasSchedule.new(api_key, braze_url, options).perform(**payload)
      end

      def trigger_canvas_schedule(**payload)
        BrazeRuby::REST::TriggerCanvasSchedule.new(api_key, braze_url, options).perform(**payload)
      end

      def trigger_canvas_send(**payload)
        BrazeRuby::REST::TriggerCanvasSend.new(api_key, braze_url, options, **payload).perform
      end

      def canvas_details(**payload)
        BrazeRuby::REST::CanvasDetails.new(api_key, braze_url, options, **payload).perform
      end
    end
  end
end
