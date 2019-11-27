# frozen_string_literal: true

require 'spec_helper'

describe 'email status' do
  let(:email) { 'john@example.com' }
  let(:status) { :unsubscribed }

  subject do
    api.email_status(email: email, status: status)
  end

  context 'existing email', vcr: true do
    it 'responds with created' do
      expect(subject.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(subject.body)).to eq(
        'message' => 'success'
      )
    end
  end

  context 'unknown email', vcr: true do
    let(:email) { 'notthere@example.com' }

    it 'responds with bad request' do
      expect(subject.status).to be 201
    end

    it 'responds with success message' do
      expect(JSON.parse(subject.body)).to eq(
        'message' => 'success'
      )
    end
  end
end
