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
          attributes: {
            external_id: 123,
            first_name: "Josh",
            last_name: "Nussbaum",
            gender: "male",
            email: "joshnuss@gmail.com",
            country: "CA"
          }
        }
      ).and_return('message' => 'success')

      expect(appboy.track(
        external_id: 123,
        first_name: "Josh",
        last_name: "Nussbaum",
        gender: "male",
        email: "joshnuss@gmail.com",
        country: "CA")).to be_true
    end

    it "handles error"
  end
end
