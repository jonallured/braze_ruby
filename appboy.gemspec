# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appboy/version'

Gem::Specification.new do |spec|
  spec.name          = 'appboy'
  spec.version       = Appboy::VERSION
  spec.authors       = ['Josh Nussbaum', 'Hugo Bastien']
  spec.email         = %w(josh@godynamo.com hugo@godynamo.com)
  spec.description   = %q{Appboy wrapper}
  spec.summary       = %q{A wrapper for the Appboy REST API, track users/events/purchases, send & schedule messages}
  spec.homepage      = 'http://appboy.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'virtus'
  spec.add_dependency 'faraday'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'activesupport'
end
