# frozen_string_literal: true

require "braze_ruby/version"
require "braze_ruby/configuration"

module BrazeRuby
  autoload :API, "braze_ruby/api"
  autoload :REST, "braze_ruby/rest"
  autoload :Endpoints, "braze_ruby/endpoints"

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
