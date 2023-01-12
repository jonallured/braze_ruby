# frozen_string_literal: true

require "spec_helper"

describe "delete users" do
  let(:external_ids) { [400, 401, 402] }

  subject(:delete_users) do
    api.delete_users(external_ids)
  end

  context "with success", vcr: true do
    it "responds with created" do
      expect(delete_users.status).to be 201
    end

    it "responds with success message" do
      expect(JSON.parse(delete_users.body)).to include(
        "deleted" => 3,
        "message" => "success"
      )
    end
  end

  context "unauthorized", vcr: true do
    let(:api_key) { "non-existent" }

    it "responds with unauthorized" do
      expect(delete_users.status).to be 401
    end
  end
end

describe "delete users by alias" do
  let(:user_aliases) { ["alias1", "alias2", "alias3"] }

  subject(:delete_users_by_alias) do
    api.delete_users_by_alias(user_aliases)
  end

  context "with success", vcr: true do
    it "responds with created" do
      expect(delete_users_by_alias.status).to be 201
    end

    it "responds with success message" do
      expect(JSON.parse(delete_users_by_alias.body)).to include(
        "deleted" => 3,
        "message" => "success"
      )
    end
  end

  context "unauthorized", vcr: true do
    let(:api_key) { "non-existent" }

    it "responds with unauthorized" do
      expect(delete_users_by_alias.status).to be 401
    end
  end
end

describe "delete users by braze id" do
  let(:braze_ids) { ["id1", "id2", "id3"] }

  subject(:delete_users_by_braze_id) do
    api.delete_users_by_braze_id(braze_ids)
  end

  context "with success", vcr: true do
    it "responds with created" do
      expect(delete_users_by_braze_id.status).to be 201
    end

    it "responds with success message" do
      expect(JSON.parse(delete_users_by_braze_id.body)).to include(
        "deleted" => 3,
        "message" => "success"
      )
    end
  end

  context "unauthorized", vcr: true do
    let(:api_key) { "non-existent" }

    it "responds with unauthorized" do
      expect(delete_users_by_braze_id.status).to be 401
    end
  end
end