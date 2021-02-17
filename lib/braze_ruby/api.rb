# frozen_string_literal: true

require 'braze_ruby/deprecated'
require 'braze_ruby/endpoints/track_users'
require 'braze_ruby/endpoints/send_messages'
require 'braze_ruby/endpoints/schedule_messages'
require 'braze_ruby/endpoints/email_status'
require 'braze_ruby/endpoints/email_sync'
require 'braze_ruby/endpoints/delete_users'
require 'braze_ruby/endpoints/campaigns'
require 'braze_ruby/endpoints/canvas'
require 'braze_ruby/endpoints/subscription'
require 'braze_ruby/endpoints/rename_external_ids'
require 'braze_ruby/endpoints/remove_external_ids'

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
    include BrazeRuby::Endpoints::Canvas
    include BrazeRuby::Endpoints::Subscription
    include BrazeRuby::Endpoints::IdentifyUsers
    include BrazeRuby::Endpoints::CreateUserAliases
    include BrazeRuby::Endpoints::RenameExternalIds
    include BrazeRuby::Endpoints::RemoveExternalIds

    def export_users(**payload)
      BrazeRuby::REST::ExportUsers.new(api_key, braze_url, options).perform(**payload)
    end

    def list_segments
      BrazeRuby::REST::ListSegments.new(api_key, braze_url, options).perform
    end

    attr_reader :api_key, :braze_url, :options

    def initialize(api_key, braze_url, options = {})
      @api_key = api_key
      @braze_url = braze_url
      @options = options
    end
  end
end
