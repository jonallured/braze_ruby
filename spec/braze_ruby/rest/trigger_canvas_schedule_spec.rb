# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::TriggerCanvasSchedule do
  let(:http) { double(:http) }

  let(:canvas_id) { "canvas-123" }
  let(:schedule) { {time: "2023-06-20T12:00:00"} }
  let(:payload) { {canvas_id: canvas_id, schedule: schedule} }

  subject { described_class.new :api_key, :rest_url, {} }

  before { subject.http = http }

  describe("#perform") do
    it "makes a post to the Schedule API-triggered Canvases endpoint" do
      expect(http).to receive(:post)
        .with "/canvas/trigger/schedule/create", payload

      subject.perform(**payload)
    end
  end
end
