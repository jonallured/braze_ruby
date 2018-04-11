require 'appboy/deprecated'
require 'appboy/endpoints/track_users'
require 'appboy/endpoints/send_messages'
require 'appboy/endpoints/schedule_messages'
require 'appboy/endpoints/email_status'

module Appboy
  class API
    include Appboy::Deprecated

    include Appboy::Endpoints::TrackUsers
    include Appboy::Endpoints::SendMessages
    include Appboy::Endpoints::ScheduleMessages
    include Appboy::Endpoints::EmailStatus

    def export_users(**payload)
      Appboy::REST::ExportUsers.new.perform(api_key, payload)
    end

    def list_segments
      Appboy::REST::ListSegments.new.perform(api_key)
    end

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end
