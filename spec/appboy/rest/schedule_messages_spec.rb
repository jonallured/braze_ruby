require 'spec_helper'

describe Appboy::REST::ScheduleMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    send_at: :send_at,
    segment_id: :segment_id,
    local_timezone: :local_timezone,
    messages: :messages
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id, payload) }

  before { subject.http = http }

  it 'makes an http call to the schedule messages endpoint' do
    expect_schedule_messages_http_call

    subject.perform
  end

  def expect_schedule_messages_http_call
    expect(http).to receive(:post).with '/messages/schedule', {
      app_group_id: app_group_id,
      segment_ids: [:segment_id],
      send_at: :send_at,
      deliver_in_local_timezone: :local_timezone,
      messages: :messages
    }
  end
end
