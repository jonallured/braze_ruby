# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ExportUsers do
  let(:http) { double(:http) }

  context "with external ids" do
    let(:payload) { {external_ids: [1]} }

    it "makes an api call to the users export by id endpoint" do
      expect(http).to receive(:post).with("/users/export/ids", payload)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(**payload)
    end
  end

  context "with a segment id" do
    let(:payload) { {segment_id: 1} }

    it "makes an api call to the users export by segment endpoint" do
      expect(http).to receive(:post).with("/users/export/segment", payload)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(**payload)
    end
  end

  context "without any ids" do
    let(:payload) { {} }

    it "does not make an api call" do
      expect(http).to_not receive(:post)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(**payload)
    end
  end

  context "with both types of ids" do
    let(:payload) { {external_ids: [1], segment_id: 1} }

    it "prefers the export by id endpoint and ignores the segment id" do
      expect(http).to receive(:post).with("/users/export/ids", {external_ids: [1]})
      expect(http).to_not receive(:post).with("/users/export/segment", anything)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(**payload)
    end
  end
end
