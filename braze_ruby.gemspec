lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'braze_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'braze_ruby'
  spec.version       = BrazeRuby::VERSION
  spec.authors       = ['Josh Nussbaum', 'Hugo Bastien', 'Justin Boltz']
  spec.email         = %w(josh@godynamo.com hugo@godynamo.com justin.boltz@takl.com)
  spec.description   = %q{Braze wrapper}
  spec.summary       = %q{A wrapper for the Braze REST API forked from the appboy gem, track users/events/purchases, send & schedule messages}
  spec.homepage      = 'https://www.braze.com/'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jboltz88/braze_ruby"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '>= 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'factory_bot'
end
