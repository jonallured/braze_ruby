require "spec_helper"

class BrazeRuby::Client
  def track_users(payload)
    endpoint_url = "/users/track"
    connection.post(endpoint_url, payload)
  end
end

describe "Something" do
  it "omg" do
    base_url = "https://api.braze.com"
    endpoint_url = "/users/track"
    payload = {email: "jon@jonallured.com"}
    connection = Faraday.new(url: base_url) do |f|
      f.request :json
      f.response :json
    end

    response = connection.post(endpoint_url, payload)
    expect(response.body).to eq anything
  end
end
