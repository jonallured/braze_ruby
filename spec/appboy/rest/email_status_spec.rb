require 'spec_helper'

describe Appboy::REST::EmailStatus do
  let(:http) { double(:http) }

  before { subject.http = http }

  subject { described_class.new(:api_key, email: :email, status: :status) }

  it 'makes an http call to the email status endpoint' do
    expect(http).to receive(:post).with '/email/status', {
      api_key: :api_key,
      email: :email,
      subscription_state: :status
    }

    subject.perform
  end
end
