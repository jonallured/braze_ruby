# frozen_string_literal: true

module BrazeRuby
  module REST
    class TriggerCanvasSchedule < Base
      def perform(canvas_id:, schedule:, **opts)
        http.post("/canvas/trigger/schedule/create", {
          canvas_id: canvas_id,
          schedule: schedule,
          **opts
        })
      end
    end
  end
end
