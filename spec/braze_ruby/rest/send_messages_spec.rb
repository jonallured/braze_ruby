# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::SendMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    messages: :messages,
    external_user_ids: :external_user_ids,
  }}

  let(:api_key) { :api_key }

  subject { described_class.new(api_key,
    messages: :messages,
    external_user_ids: :external_user_ids
  ) }

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/messages/send', {
      api_key: :api_key,
      messages: [],
      external_user_ids: [],
    }
  end
end
