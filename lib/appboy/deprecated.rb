module Appboy
  module Deprecated
    def track(attribute, events = [], purchases = [])
      warn('[Appboy] `track` is deprecated. Please use `track_users` instead.')
      track_users(attribute: attribute, events: events, purchases: purchases)
    end

    def send_message(message, user_ids, segment_ids = nil)
      warn('[Appboy] `send_message` is deprecated. Please use `send_messages` instead.')
      send_messages(messages: message, user_ids: user_ids, segment_ids: segment_ids)
    end

    def schedule_message(date, message, segment_id, local_timezone = false)
      warn('[Appboy] `schedule_message` is deprecated. Please use `schedule_messages` instead.')
      schedule_messages(send_at: date, messages: message,
        segment_id: segment_id, local_timezone: local_timezone)
    end
  end
end
