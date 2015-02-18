require 'appboy/deprecated'
require 'appboy/rest/track_users'
require 'appboy/endpoints/track_users'

module Appboy
  class API
    include Appboy::Deprecated
    include Appboy::Endpoints::TrackUsers

    attr_reader :app_group_id

    def initialize(app_group_id)
      @app_group_id = app_group_id
    end

    def send_messages(messages:, user_ids:, segment_id: nil)
      connection.post '/messages/send' do |request|
        request.body = {
          app_group_id:      app_group_id,
          messages:          messages,
          external_user_ids: user_ids,
          segment_ids:       [segment_id].compact
        }
      end
    end

    def schedule_messages(send_at:, messages:, segment_id:, local_timezone: false)
      connection.post '/messages/schedule' do |request|
        request.body = {
          app_group_id:      app_group_id,
          segment_ids:               [segment_id],
          send_at:                   send_at,
          deliver_in_local_timezone: local_timezone,
          messages:                  messages
        }
      end
    end

    def connection
      @connection ||= Faraday.new(url: 'https://api.appboy.com') do |connection|
        connection.request :json

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
