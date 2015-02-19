require 'factory_girl'
require 'factories'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.lint
  end
end
