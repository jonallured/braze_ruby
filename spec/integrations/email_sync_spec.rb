# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'email sync' do
  describe 'unsubscribes' do
    it 'responds with unsubscribed emails', vcr: true do
      response = api.email_unsubscribes(start_date: '2020-06-17', end_date: '2020-06-18')
      emails = JSON.parse(response.body)['emails']

      expect(emails.size).to eq(1)
      expect(emails.first['email']).to eq('example@123.com')
    end

    it 'responds with empty array when no unsubscribes', vcr: true do
      response = api.email_unsubscribes(start_date: '2019-02-20', end_date: '2019-02-25')
      emails = JSON.parse(response.body)['emails']

      expect(emails.size).to eq(0)
    end
  end

  describe 'hard_bounces' do
    it 'responds with empty array when no hard bounces', vcr: true do
      response = api.email_hard_bounces(start_date: '2019-02-20', end_date: '2019-02-25')
      emails = JSON.parse(response.body)['emails']

      expect(emails.size).to eq(0)
    end
  end
end
