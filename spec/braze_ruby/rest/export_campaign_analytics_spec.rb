# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ExportCampaignAnalytics do
  let(:http) { double(:http) }
  let(:options) { {campaign_id: 1} }

  it "makes an api call to the export campaign analytics endpoint" do
    expect(http).to receive(:get).with("/campaigns/data_series", options)

    export_users = BrazeRuby::REST::ExportCampaignAnalytics.new(:api_key, :rest_url, options)
    export_users.http = http
    export_users.perform(**options)
  end
end
