# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::DeleteTriggerCampaignSchedule do
  let(:http) { double(:http) }

  let(:schedule_id) { "schedule-123" }
  let(:campaign_id) { "campaign-123" }
  let(:payload) { {schedule_id: schedule_id, campaign_id: campaign_id} }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the delete scheduled api trigger enpoint" do
    expect(http).to receive(:post).with("/campaigns/trigger/schedule/delete", payload)

    subject.perform(campaign_id: campaign_id, schedule_id: schedule_id)
  end
end
