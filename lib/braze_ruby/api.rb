# frozen_string_literal: true

require "braze_ruby/deprecated"
require "braze_ruby/endpoints/track_users"
require "braze_ruby/endpoints/send_messages"
require "braze_ruby/endpoints/schedule_messages"
require "braze_ruby/endpoints/email_status"
require "braze_ruby/endpoints/email_sync"
require "braze_ruby/endpoints/export"
require "braze_ruby/endpoints/delete_users"
require "braze_ruby/endpoints/campaigns"
require "braze_ruby/endpoints/canvas"
require "braze_ruby/endpoints/catalogs"
require "braze_ruby/endpoints/subscription"
require "braze_ruby/endpoints/rename_external_ids"
require "braze_ruby/endpoints/remove_external_ids"
require "braze_ruby/endpoints/remove_email_addresses_from_spam"

module BrazeRuby
  class API
    include BrazeRuby::Deprecated

    include BrazeRuby::Endpoints::TrackUsers
    include BrazeRuby::Endpoints::SendMessages
    include BrazeRuby::Endpoints::ScheduleMessages
    include BrazeRuby::Endpoints::EmailStatus
    include BrazeRuby::Endpoints::EmailSync
    include BrazeRuby::Endpoints::Export
    include BrazeRuby::Endpoints::DeleteUsers
    include BrazeRuby::Endpoints::Campaigns
    include BrazeRuby::Endpoints::Canvas
    include BrazeRuby::Endpoints::Catalogs
    include BrazeRuby::Endpoints::Subscription
    include BrazeRuby::Endpoints::IdentifyUsers
    include BrazeRuby::Endpoints::CreateUserAliases
    include BrazeRuby::Endpoints::RenameExternalIds
    include BrazeRuby::Endpoints::RemoveExternalIds
    include BrazeRuby::Endpoints::RemoveEmailAddressesFromSpam

    def export_users(**payload)
      BrazeRuby::REST::ExportUsers.new(api_key, braze_url, options).perform(**payload)
    end

    def list_segments
      BrazeRuby::REST::ListSegments.new(api_key, braze_url, options).perform
    end

    attr_reader :api_key, :braze_url, :options

    def initialize(api_key = nil, braze_url = nil, options = nil)
      @api_key = api_key || BrazeRuby.configuration.rest_api_key
      @braze_url = braze_url || BrazeRuby.configuration.rest_url
      @options = options || BrazeRuby.configuration.options || {}
    end
  end
end
