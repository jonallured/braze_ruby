# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::SendMessages do
  let(:http) { double(:http) }

  subject { described_class.new(
    :api_key,
    :rest_url,
    {},
    messages: ["message"],
    external_user_ids: ["1", "2"]
  ) }

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/messages/send', {
      messages: ["message"],
      external_user_ids: ["1", "2"],
    }
  end
end
