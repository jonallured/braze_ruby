# frozen_string_literal: true

require "braze_ruby/deprecated"
require "braze_ruby/endpoints/track_users"
require "braze_ruby/endpoints/send_messages"
require "braze_ruby/endpoints/schedule_messages"
require "braze_ruby/endpoints/email_status"
require "braze_ruby/endpoints/email_sync"
require "braze_ruby/endpoints/delete_users"
require "braze_ruby/endpoints/campaigns"
require "braze_ruby/endpoints/canvas"
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
    include BrazeRuby::Endpoints::DeleteUsers
    include BrazeRuby::Endpoints::Campaigns
    include BrazeRuby::Endpoints::Canvas
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

    def initialize(rest_api_key = nil, rest_url = nil, options = nil)
      @api_key = rest_api_key || configuration.rest_api_key
      @braze_url = rest_url || configuration.rest_url
      @options = options || configuration.options || {}

      raise ArgumentError, "BrazeRuby.configure rest_api_key is missing" if @api_key.nil? || @api_key.empty?
      raise ArgumentError, "BrazeRuby.configure rest_url is missing"  if @braze_url.nil? || @braze_url.empty?
    end

    private

    def configuration
      BrazeRuby.configuration
    end
  end
end
