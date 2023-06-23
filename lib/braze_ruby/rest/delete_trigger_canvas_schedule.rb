# frozen_string_literal: true

module BrazeRuby
  module REST
    class DeleteTriggerCanvasSchedule < Base
      def perform(canvas_id:, schedule_id:)
        http.post(
          "/canvas/trigger/schedule/delete",
          canvas_id: canvas_id,
          schedule_id: schedule_id
        )
      end
    end
  end
end
