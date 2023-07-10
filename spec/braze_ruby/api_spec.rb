# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::API do
  let(:rest_api_key) { SecureRandom.uuid }
  let(:rest_url) { "https://braze.example.com" }
  let(:options) { {option: "value"} }

  context "takes into account config options for implicit instanciation" do
    subject(:api) { BrazeRuby::API.new }

    before do
      BrazeRuby.configure do |config|
        config.rest_api_key = rest_api_key
        config.rest_url = rest_url
        config.options = options
      end
    end

    it "braze_url" do
      expect(api.braze_url).to eq(rest_url)
    end

    it "api_key" do
      expect(api.api_key).to eq(rest_api_key)
    end

    it "options" do
      expect(api.options).to eq({option: "value"})
    end
  end

  context "supports explicit instanciation" do
    subject(:api) { BrazeRuby::API.new(rest_api_key, rest_url, options) }

    it "braze_url" do
      expect(api.braze_url).to eq(rest_url)
    end

    it "api_key" do
      expect(api.api_key).to eq(rest_api_key)
    end

    it "options" do
      expect(api.options).to eq({option: "value"})
    end
  end
end
