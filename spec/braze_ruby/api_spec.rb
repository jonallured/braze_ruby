# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::API do
  describe "#new" do
    before do
      BrazeRuby.reset
    end

    context "with no configuration settings" do
      it "has nil for configuration settings" do
        api = BrazeRuby::API.new

        expect(api.api_key).to eq nil
        expect(api.braze_url).to eq nil
        expect(api.options).to eq({})
      end
    end

    context "with instance configuration settings" do
      it "has those instance configuration settings" do
        api = BrazeRuby::API.new(
          "instance-api-key",
          "instance-braze-url",
          {key: "instance-options"}
        )

        expect(api.api_key).to eq "instance-api-key"
        expect(api.braze_url).to eq "instance-braze-url"
        expect(api.options).to eq({key: "instance-options"})
      end
    end

    context "with global configuration settings" do
      it "has those global configuration settings" do
        BrazeRuby.configure do |config|
          config.rest_api_key = "global-api-key"
          config.rest_url = "global-braze-url"
          config.options = {key: "global-options"}
        end

        api = BrazeRuby::API.new

        expect(api.api_key).to eq "global-api-key"
        expect(api.braze_url).to eq "global-braze-url"
        expect(api.options).to eq({key: "global-options"})
      end
    end

    context "with instance and global configuration settings" do
      it "ignores the global settings and prefers the instance settings" do
        BrazeRuby.configure do |config|
          config.rest_api_key = "global-api-key"
          config.rest_url = "global-braze-url"
          config.options = {key: "global-options"}
        end

        api = BrazeRuby::API.new(
          "instance-api-key",
          "instance-braze-url",
          {key: "instance-options"}
        )

        expect(api.api_key).to eq "instance-api-key"
        expect(api.braze_url).to eq "instance-braze-url"
        expect(api.options).to eq({key: "instance-options"})
      end
    end
  end
end
