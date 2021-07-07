# frozen_string_literal: true

require "spec_helper"

RSpec.describe "subscription", vcr: true do
  let(:subscription_group_id) { "ed06e19a-69b1-4f9b-a452-2db2c4e303a8" }
  let(:subscribed_user) { "test-user-1" }
  let(:unsubscribed_user) { "test-user-2" }
  let(:never_subscribed_user) { "test-user-3" }

  context "when getting subscription group statuses" do
    let(:json_response) { JSON.parse(response.body) }

    before do
      api.subscription_status_set(
        external_id: subscribed_user,
        subscription_group_id: subscription_group_id,
        subscription_state: "subscribed"
      )

      api.subscription_status_set(
        external_id: unsubscribed_user,
        subscription_group_id: subscription_group_id,
        subscription_state: "unsubscribed"
      )
    end

    describe "subscription_user_status" do
      subject(:response) do
        api.subscription_user_status(
          external_id: external_id
        )
      end

      let(:external_id) { [subscribed_user, unsubscribed_user, never_subscribed_user] }

      it "returns subscription groups and status for every group" do
        expect(response.status).to eq(200)
        expect(json_response).to match(
          "message" => "success",
          "total_count" => 3,
          "users" => [
            hash_including(
              "external_id" => subscribed_user,
              "subscription_groups" => [
                hash_including(
                  "id" => subscription_group_id,
                  "status" => "Subscribed"
                )
              ]
            ),
            hash_including(
              "external_id" => unsubscribed_user,
              "subscription_groups" => [
                hash_including(
                  "id" => subscription_group_id,
                  "status" => "Unsubscribed"
                )
              ]
            ),
            hash_including(
              "external_id" => never_subscribed_user,
              "subscription_groups" => []
            )
          ]
        )
      end
    end

    describe "subscription_status_get" do
      subject(:response) do
        api.subscription_status_get(
          external_id: external_id,
          subscription_group_id: subscription_group_id
        )
      end

      context "when checking subscribed and unsubscribed user status" do
        let(:external_id) { [subscribed_user, unsubscribed_user, never_subscribed_user] }

        it "returns only users that were once subscribed" do
          expect(response.status).to eq(200)
          expect(json_response).to eq(
            "message" => "success",
            "status" => {
              "test-user-1" => "Subscribed",
              "test-user-2" => "Unsubscribed",
              "test-user-3" => "unknown"
            }
          )
        end
      end

      context "when group does not exist" do
        let(:external_id) { subscribed_user }
        let(:subscription_group_id) { "non-existing-subscription-group" }

        it "returns an error" do
          expect(response.status).to eq(400)
        end
      end
    end
  end

  describe "subscription_status_set" do
    subject(:response) do
      api.subscription_status_set(
        external_id: external_id,
        subscription_group_id: subscription_group_id,
        subscription_state: subscription_state
      )
    end

    let(:external_id) { subscribed_user }
    let(:subscription_state) { "subscribed" }

    context "when subscribing" do
      it "subscribes the user" do
        expect(response.status).to eq(201)
      end
    end

    context "when unsubscribing" do
      let(:external_id) { unsubscribed_user }
      let(:subscription_state) { "unsubscribed" }

      before do
        api.subscription_status_set(
          external_id: external_id,
          subscription_group_id: subscription_group_id,
          subscription_state: "subscribed"
        )
      end

      it "unsubscribes the user" do
        expect(response.status).to eq(201)
      end
    end

    context "when subscription group does not exist" do
      let(:subscription_group_id) { "non-existing-subscription-group" }

      it "returns an error status" do
        expect(response.status).to eq(400)
      end
    end
  end
end
