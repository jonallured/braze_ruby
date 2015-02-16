require 'appboy/deprecated'

module Appboy
  class API
    include Appboy::Deprecated

    def initialize(app_group_id)
      @app_group_id = app_group_id
    end

    def track_users(attributes: [], events: [], purchases: [])
      connection.post '/users/track' do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = {
          app_group_id:   app_group_id,
          attributes:     attributes,
          events:         events,
          purchases:      purchases
        }.to_json
      end
    end

    def send_messages(messages:, user_ids:, segment_id: nil)
      connection.post '/messages/send' do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = {
          app_group_id:      app_group_id,
          messages:          messages,
          external_user_ids: user_ids,
          segment_ids:       [segment_id].compact
        }.to_json
      end
    end

    def schedule_messages(send_at:, messages:, segment_id:, local_timezone: false)
      connection.post '/messages/schedule' do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = {
          app_group_id:      app_group_id,
          segment_ids:               [segment_id],
          send_at:                   send_at,
          deliver_in_local_timezone: local_timezone,
          messages:                  messages
        }.to_json
      end
    end

    private

    attr_reader :app_group_id

    def connection
      @connection ||= Faraday.new(url: 'https://api.appboy.com') do |connection|
        connection.request :json

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
