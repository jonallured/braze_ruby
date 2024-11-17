# frozen_string_literal: true

require "spec_helper"

class API
  include BrazeRuby::Endpoints::DeleteUsers

  def api_key
    :api_key
  end
end

describe BrazeRuby::Endpoints::DeleteUsers do
  let(:api) { API.new }
  let(:delete_users_rest) { double(:delete_users_rest) }

  before { api.delete_users_rest = delete_users_rest }

  describe "#delete_users" do
    let(:payload) { [1, 2, 3] }

    subject(:delete_users!) { api.delete_users(payload) }

    it "deletes users" do
      expect(delete_users_rest).to receive(:perform)
        .with(external_ids: payload)

      delete_users!
    end
  end
end
