# frozen_string_literal: true

require "braze_ruby/http"

module BrazeRuby
  class API
    attr_reader :http

    def initialize(api_key = nil, braze_url = nil, options = nil)
      api_key ||= BrazeRuby.configuration.rest_api_key
      braze_url ||= BrazeRuby.configuration.rest_url
      options ||= BrazeRuby.configuration.options || {}

      @http = HTTP.new(api_key, braze_url, options)
    end

    def export_users(external_ids: nil, segment_id: nil, **options)
      if external_ids
        http.post "/users/export/ids", {
          external_ids: external_ids
        }.merge(options)
      elsif segment_id
        http.post "/users/export/segment", {
          segment_id: segment_id
        }.merge(options)
      end
    end

    def list_segments
      http.get "/segments/list"
    end
  end
end
