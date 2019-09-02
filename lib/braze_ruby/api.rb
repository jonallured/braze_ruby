require 'braze_ruby/deprecated'
require 'braze_ruby/endpoints/track_users'
require 'braze_ruby/endpoints/send_messages'
require 'braze_ruby/endpoints/schedule_messages'
require 'braze_ruby/endpoints/email_status'
require 'braze_ruby/endpoints/email_sync'
require 'braze_ruby/endpoints/delete_users'
require 'braze_ruby/endpoints/campaigns'

module BrazeRuby
  class API
    include BrazeRuby::Deprecated

    include BrazeRuby::Endpoints::TrackUsers
    include BrazeRuby::Endpoints::SendMessages
    include BrazeRuby::Endpoints::ScheduleMessages
    include BrazeRuby::Endpoints::EmailStatus
    include BrazeRuby::Endpoints::EmailSync
    include BrazeRuby::Endpoints::DeleteUsers
    include BrazeRuby::Endpoints::Campaigns

    def export_users(**payload)
      BrazeRuby::REST::ExportUsers.new(braze_url).perform(api_key, payload)
    end

    def list_segments
      BrazeRuby::REST::ListSegments.new(braze_url).perform(api_key)
    end

    attr_reader :api_key, :braze_url

    def initialize(api_key, braze_url)
      @api_key = api_key
      @braze_url = braze_url
    end
  end
end
