# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::DeleteTriggerCanvasSchedule do
  let(:http) { double(:http) }

  let(:schedule_id) { "schedule-123" }
  let(:canvas_id) { "canvas-123" }
  let(:payload) { {schedule_id: schedule_id, canvas_id: canvas_id} }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  it "makes an http call to the delete scheduled api trigger enpoint" do
    expect(http).to receive(:post).with("/canvas/trigger/schedule/delete", payload)

    subject.perform(canvas_id: canvas_id, schedule_id: schedule_id)
  end
end
