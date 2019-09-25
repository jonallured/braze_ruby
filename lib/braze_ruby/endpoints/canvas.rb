module BrazeRuby
  module Endpoints
    module Canvas
      def trigger_canvas_send(**payload)
        BrazeRuby::REST::TriggerCanvasSend.new(api_key, braze_url, payload).perform
      end
    end
  end
end
