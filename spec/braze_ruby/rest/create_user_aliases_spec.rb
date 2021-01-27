# frozen_string_literal: true

require 'spec_helper'

describe BrazeRuby::REST::CreateUserAliases do
  let(:http) { double(:http) }

  let(:payload) { {user_aliases: [user]} }
  let(:user) { { user_alias: { alias_name: 'abc', alias_label: 'foo' } } }

  let(:api_key) { :api_key }

  subject { described_class.new :api_key, :rest_url, {}}

  before { subject.http = http }

  it 'makes an http call to the user aliases endpoint' do
    expect(http).to receive(:post).with '/users/alias/new',
        payload

    subject.perform(**payload)
  end
end
