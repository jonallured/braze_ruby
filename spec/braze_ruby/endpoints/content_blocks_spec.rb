# frozen_string_literal: true

require "spec_helper"

class API
  include BrazeRuby::Endpoints::ContentBlocks

  def api_key
    :api_key
  end
end

describe BrazeRuby::Endpoints::ContentBlocks do
  describe "#list_content_blocks" do
    let(:api) { API.new }
    let(:content_blocks_service) { double(:content_blocks_service) }

    before { api.content_blocks_service = content_blocks_service }

    it "lists content blocks" do
      expect(content_blocks_service).to receive(:perform)
      api.list_content_blocks
    end

    # https://www.braze.com/docs/api/endpoints/templates/content_blocks_templates/get_list_email_content_blocks/
    xit "supports optional params"
  end
end
