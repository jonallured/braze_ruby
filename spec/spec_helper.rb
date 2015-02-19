require 'pry'
require 'dotenv'
require 'bundler/setup'

Bundler.setup
Dotenv.load

require 'appboy'
require 'support/vcr'
require 'support/factory_girl'
require 'support/integrations'

RSpec.configure do |config|
  def test_time
    Time.parse('2015-02-15 00:00:00 -0500')
  end
end
