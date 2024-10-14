# frozen_string_literal: true

require "spec_helper"

RSpec.describe "catalogs" do

  describe "create_catalog" do
    subject(:create_catalog) do
      api.create_catalog(
        catalogs: [
          {
            name: "restaurants",
            description: "My Restaurants",
            fields: [
              { name: "id", "type": "string" },
              { name: "Name", "type": "string" },
              { name: "City", "type": "string" },
              { name: "Cuisine", "type": "string" },
              { name: "Rating", "type": "number" },
              { name: "Loyalty_Program", "type": "boolean" },
              { name: "Location", "type": "object" },
              { name: "Created_At", "type": "time" }
            ]
          }
        ]
      )
    end

    context "with success", vcr: true do
      it "responds with created and success message" do
        expect(create_catalog.status).to be 201

        parsed_body = JSON.parse(create_catalog.body)

        expect(parsed_body["message"]).to eq("success")

        expect(parsed_body["catalogs"].size).to eq(1)

        expect(parsed_body["catalogs"][0]["name"]).to eq("restaurants")
        expect(parsed_body["catalogs"][0]["num_items"]).to eq(0)
      end
    end
  end

end
