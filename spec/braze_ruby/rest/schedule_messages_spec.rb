# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ScheduleMessages do
  let(:http) { double(:http) }

  let(:payload) do
    {
      external_user_ids: :external_user_ids,
      time: :time,
      in_local_time: :in_local_time,
      messages: :messages
    }
  end

  def params_from(payload)
    {
      external_user_ids: payload[:external_user_ids],
      schedule: {
        time: payload[:time],
        in_local_time: payload[:in_local_time]
      },
      messages: payload[:messages]
    }
  end

  subject { described_class.new(:api_key, :rest_url, {}, **payload) }

  before { subject.http = http }

  it "makes an http call to the schedule messages endpoint" do
    expect(http).to receive(:post).with "/messages/schedule/create", params_from(payload)

    subject.perform
  end
end
