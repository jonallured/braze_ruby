# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::IdentifyUsers do
  let(:http) { double(:http) }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  context "with aliases_to_identify" do
    let(:user) do
      {
        external_id: 123,
        user_alias: {alias_name: "abc", alias_label: "foo"}
      }
    end

    it "posts aliases to the identify users endpoint" do
      expect(http).to receive(:post).with "/users/identify", {
        aliases_to_identify: [user]
      }

      subject.perform(aliases_to_identify: [user])
    end
  end

  context "with emails_to_identify" do
    let(:user) do
      {
        external_id: 123,
        email: "user@example.com",
        prioritization: %w[unidentified most_recently_updated]
      }
    end

    it "posts emails to the identify users endpoint" do
      expect(http).to receive(:post).with "/users/identify", {
        emails_to_identify: [user]
      }

      subject.perform(emails_to_identify: [user])
    end
  end

  context "with phone_numbers_to_identify" do
    let(:user) do
      {
        external_id: 123,
        phone: "+15555555555",
        prioritization: %w[unidentified most_recently_updated]
      }
    end

    it "posts phone numbers to the identify users endpoint" do
      expect(http).to receive(:post).with "/users/identify", {
        phone_numbers_to_identify: [user]
      }

      subject.perform(phone_numbers_to_identify: [user])
    end
  end

  context "with multiple identifier types" do
    let(:alias_user) do
      {
        external_id: 123,
        user_alias: {alias_name: "abc", alias_label: "foo"}
      }
    end

    let(:email_user) do
      {
        external_id: 456,
        email: "user@example.com",
        prioritization: %w[unidentified most_recently_updated]
      }
    end

    it "includes all provided identifier types in the payload" do
      expect(http).to receive(:post).with "/users/identify", {
        aliases_to_identify: [alias_user],
        emails_to_identify: [email_user]
      }

      subject.perform(
        aliases_to_identify: [alias_user],
        emails_to_identify: [email_user]
      )
    end
  end

  context "with no arguments" do
    it "posts an empty payload" do
      expect(http).to receive(:post).with "/users/identify", {}

      subject.perform
    end
  end
end
