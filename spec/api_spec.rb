require 'spec_helper'

describe Appboy::API do
  let(:appboy) { Appboy::API.new('secret-key', 'app-group-id')}

  context "#track" do
    it "tracks user" do
      Appboy::API.should_receive(:post).with(
        '/users/track',
        query: {
          company_secret: 'secret-key',
          app_group_id: 'app-group-id',
          attributes: :attributes,
          events: :events,
          purchases: :purchases
        }
      ).and_return('message' => 'success')

      expect(appboy.track(:attributes, :events, :purchases)).to be_true
    end

    it "handles error"
  end
end
