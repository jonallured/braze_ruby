# frozen_string_literal: true

require "spec_helper"

describe BrazeRuby::REST::ExportCampaignsList do
  let(:http) { double(:http) }
  let(:options) { {} }

  it "makes an api call to the export campaigns endpoint" do
    expect(http).to receive(:get).with("/campaigns/list", options)

    export_users = BrazeRuby::REST::ExportCampaignsList.new(:api_key, :rest_url, options)
    export_users.http = http
    export_users.perform(**options)
  end

end
