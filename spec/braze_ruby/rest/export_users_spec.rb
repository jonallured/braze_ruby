# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ExportUsers do
  let(:http) { double(:http) }

  let(:external_ids) { nil }
  let(:segment_id) { nil }
  let(:options) { {} }

  context "with external ids" do
    let(:external_ids) { [1] }

    it "makes an api call to the users export by id endpoint" do
      expect(http).to receive(:post).with("/users/export/ids", external_ids: external_ids)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
    end

    context "with options" do
      let(:options) { {foo: "bar"} }

      it "sends those options to the endpoint" do
        expect(http).to receive(:post).with("/users/export/ids", external_ids: [1], foo: "bar")

        export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
        export_users.http = http
        export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
      end
    end
  end

  context "with a segment id" do
    let(:segment_id) { 1 }

    it "makes an api call to the users export by segment endpoint" do
      expect(http).to receive(:post).with("/users/export/segment", segment_id: 1)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
    end

    context "with options" do
      let(:options) { {foo: "bar"} }

      it "sends those options to the endpoint" do
        expect(http).to receive(:post).with("/users/export/segment", segment_id: 1, foo: "bar")

        export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
        export_users.http = http
        export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
      end
    end
  end

  context "without any ids" do
    it "does not make an api call" do
      expect(http).to_not receive(:post)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
    end
  end

  context "with both types of ids" do
    let(:external_ids) { [1] }
    let(:segment_id) { 1 }

    it "prefers the export by id endpoint and ignores the segment id" do
      expect(http).to receive(:post).with("/users/export/ids", {external_ids: [1]})
      expect(http).to_not receive(:post).with("/users/export/segment", anything)

      export_users = BrazeRuby::REST::ExportUsers.new(:api_key, :rest_url, {})
      export_users.http = http
      export_users.perform(external_ids: external_ids, segment_id: segment_id, **options)
    end
  end
end
