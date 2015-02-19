require 'spec_helper'

describe Appboy::REST::EmailStatus do
  it 'makes an http call to the email status endpoint' do
    http = double(:http)

    service = described_class.new(:app_group_id, email: :email, status: :status)
    service.http = http

    expect(http).to receive(:post).with '/email/status', {
      app_group_id: :app_group_id,
      email: :email,
      subscription_state: :status
    }

    service.perform
  end
end
