# frozen_string_literal: true

require "spec_helper"
require "braze_ruby/http"

describe BrazeRuby::HTTP do
  describe "#connection" do
    let(:options) { double("options", "[]=": nil) }
    let(:headers) { double("headers", "[]=": nil) }
    let(:conn) { double("conn", adapter: nil, options: options, headers: headers, request: nil) }
    let(:api_key) { "braze-api-key" }
    let(:braze_url) { "http://example.com" }

    before :each do
      allow(Faraday).to receive(:new).and_yield(conn)
      allow(Faraday).to receive(:default_adapter).and_return(:default_adapter)
    end

    it "it defaults to the opeN_timeout option" do
      described_class.new(api_key, braze_url).connection

      expect(options).to have_received(:"[]=").with(:open_timeout, described_class::DEFAULT_OPEN_TIMEOUT)
    end

    it "it sets the default timeout open_option when given" do
      timeout = 5
      described_class.new(api_key, braze_url, {open_timeout: timeout}).connection

      expect(options).to have_received(:"[]=").with(:open_timeout, timeout)
    end

    it "it defaults to the timeout option" do
      described_class.new(api_key, braze_url).connection

      expect(options).to have_received(:"[]=").with(:timeout, described_class::DEFAULT_TIMEOUT)
    end

    it "it sets the default timeout option when given" do
      timeout = 5
      described_class.new(api_key, braze_url, {timeout: timeout}).connection

      expect(options).to have_received(:"[]=").with(:timeout, timeout)
    end

    it "sets the retry block if given" do
      retry_hash = {max: 2, interval: 0.05}
      described_class.new(api_key, braze_url, {retry: retry_hash}).connection
      expect(conn).to have_received(:request).with(:retry, retry_hash)
    end

    it "does not set the retry block if no retry info is passed" do
      described_class.new(api_key, braze_url).connection
      expect(conn).not_to have_received(:request)
    end

    it "sets the headers" do
      described_class.new(api_key, braze_url).connection

      expect(headers).to have_received(:"[]=").with("Content-Type", "application/json")
      expect(headers).to have_received(:"[]=").with("Accept", "application/json")
      expect(headers).to have_received(:"[]=").with("User-Agent", "Braze Ruby gem v#{BrazeRuby::VERSION}")
      expect(headers).to have_received(:"[]=").with("Authorization", "Bearer braze-api-key")
    end

    it "it sets the default adapter" do
      described_class.new(api_key, braze_url).connection

      expect(conn).to have_received(:adapter).with(:default_adapter)
    end
  end
end
