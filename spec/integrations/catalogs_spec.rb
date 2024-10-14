# frozen_string_literal: true

require "spec_helper"

RSpec.describe "catalogs" do
  # Catalog Management
  describe "create_catalogs" do
    subject(:create_catalogs) do
      api.create_catalogs(
        catalogs: [
          {
            name: "restaurants",
            description: "My Restaurants",
            fields: [
              {name: "id", type: "string"},
              {name: "Name", type: "string"},
              {name: "City", type: "string"},
              {name: "Cuisine", type: "string"},
              {name: "Rating", type: "number"},
              {name: "Loyalty_Program", type: "boolean"},
              {name: "Location", type: "object"},
              {name: "Created_At", type: "time"}
            ]
          }
        ]
      )
    end

    context "with success", vcr: true do
      it "responds with created and success message" do
        expect(create_catalogs.status).to be 201

        parsed_body = JSON.parse(create_catalogs.body)

        expect(parsed_body["message"]).to eq("success")

        expect(parsed_body["catalogs"].size).to eq(1)

        expect(parsed_body["catalogs"][0]["name"]).to eq("restaurants")
        expect(parsed_body["catalogs"][0]["num_items"]).to eq(0)
      end
    end
  end

  describe "delete_catalog" do
    subject(:delete_catalog) { api.delete_catalog("restaurants") }

    context "with success", vcr: true do
      it "responds with success message" do
        expect(delete_catalog.status).to be 200
      end
    end
  end

  describe "list catalogs" do
    subject(:list_catalogs) { api.list_catalogs }

    context "with success", vcr: true do
      it "responds with items" do
        expect(list_catalogs.status).to be 200

        parsed_body = JSON.parse(list_catalogs.body)

        expect(parsed_body["catalogs"].size).to eq(1)

        expect(parsed_body["catalogs"][0]["name"]).to eq("restaurants")
        expect(parsed_body["catalogs"][0]["num_items"]).to eq(0)
      end
    end
  end

  # Catalog Items
  describe "create_catalog_items" do
    subject(:create_catalog_items) do
      api.create_catalog_items(
        "restaurants",
        items: [
          {
            id: "restaurant1",
            Name: "Restaurant1",
            City: "New York",
            Cuisine: "American",
            Rating: 5,
            Loyalty_Program: true,
            Location: {
              Latitude: 33.6112,
              Longitude: -117.8711
            },
            Created_At: "2022-11-01T09:03:19.967+00:00"
          }
        ]
      )
    end

    context "with success", vcr: true do
      it "responds with success message" do
        expect(create_catalog_items.status).to be 202

        parsed_body = JSON.parse(create_catalog_items.body)

        expect(parsed_body["message"]).to eq("success")
      end
    end
  end

  describe "delete_catalog_items" do
    subject(:delete_catalog_items) do
      api.delete_catalog_items(
        "restaurants",
        items: [
          {id: "restaurant1"}
        ]
      )
    end

    context "with success", vcr: true do
      it "responds with success message" do
        expect(delete_catalog_items.status).to be 202

        parsed_body = JSON.parse(delete_catalog_items.body)

        expect(parsed_body["message"]).to eq("success")
      end
    end
  end

  describe "update_catalog_items" do
    subject(:update_catalog_items) do
      api.update_catalog_items(
        "restaurants",
        items: [
          {
            id: "restaurant1",
            Name: "Restaurant1",
            City: "New York",
            Cuisine: "American",
            Rating: 5,
            Loyalty_Program: true,
            Location: {
              Latitude: 33.6112,
              Longitude: -117.8711
            },
            Created_At: "2022-11-01T09:03:19.967+00:00"
          }
        ]
      )
    end

    context "with success", vcr: true do
      it "responds with success message" do
        expect(update_catalog_items.status).to be 202

        parsed_body = JSON.parse(update_catalog_items.body)

        expect(parsed_body["message"]).to eq("success")
      end
    end
  end
end
