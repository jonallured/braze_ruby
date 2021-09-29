module BrazeRuby
  class Configuration
    attr_accessor :rest_api_key,
      :rest_url,
      :options # See BrazeRuby::HTTP#default_options

    def initialize
      @rest_api_key = nil
      @rest_url = nil
      @options = nil
    end
  end
end
