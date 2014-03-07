require 'spec_helper'

describe Appboy::API do
  let(:appboy) { Appboy::API.new('secret-key', 'app-group-id')}

  context "#track" do
    it "calls api" do
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

  context "#send_message" do
    it "calls api" do
      Appboy::API.should_receive(:post).with(
        '/messages/send',
        query: {
          company_secret: 'secret-key',
          app_group_id: 'app-group-id',
          external_user_ids: :user_ids,
          segment_ids: :segment_ids,
          messages: :message
        }
      ).and_return('message' => 'success')

      expect(appboy.send_message(:message, :user_ids, :segment_ids)).to be_true
    end
    it "handles error"
  end
end
