# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::API do
    it "can be initialized with Rails style configuration" do
        # configuration is already set by spec_helper
        expect{BrazeRuby::API.new}.to_not raise_error
    end

    it "initialization raises argument error when missing configuration" do
        # override configuration from spec_helper
        BrazeRuby.configure do |config|
            config.rest_api_key = nil
            config.rest_url = nil
        end

        expect{BrazeRuby::API.new}.to raise_error(ArgumentError)
    end
end