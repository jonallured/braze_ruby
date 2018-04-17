require 'spec_helper'

describe BrazeRuby::REST::ScheduleMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    segment_id: :segment_id,
    schedule: {
      time: :time,
      in_local_time: :in_local_time
    },
    messages: :messages
  }}

  let(:api_key) { :api_key }

  subject { described_class.new(api_key, payload) }

  before { subject.http = http }

  it 'makes an http call to the schedule messages endpoint' do
    expect_schedule_messages_http_call

    subject.perform
  end

  def expect_schedule_messages_http_call
    expect(http).to receive(:post).with '/messages/schedule', {
      api_key: api_key,
      segment_ids: [:segment_id],
      schedule: {
        time: :time,
        in_local_time: :in_local_time
      },
      deliver_in_local_timezone: :local_timezone,
      messages: :messages
    }
  end
end
