require 'spec_helper'

describe Appboy::REST::SendMessages do
  let(:http) { double(:http) }

  let(:payload) {{
    messages: :messages,
    external_user_ids: :external_user_ids,
    segment_id: :segment_id
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(app_group_id,
    messages: :messages,
    external_user_ids: :external_user_ids,
    segment_id: :segment_id
  ) }

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect_send_messages_http_call

    subject.perform
  end

  def expect_send_messages_http_call
    expect(http).to receive(:post).with '/messages/send', {
      app_group_id: :app_group_id,
      messages: :messages,
      external_user_ids: :external_user_ids,
      segment_ids: [:segment_id]
    }
  end
end
