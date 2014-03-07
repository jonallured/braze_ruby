# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appboy/version'

Gem::Specification.new do |spec|
  spec.name          = "appboy"
  spec.version       = Appboy::VERSION
  spec.authors       = ["Josh Nussbaum"]
  spec.email         = ["josh@godynamo.com"]
  spec.description   = %q{Appboy wrapper}
  spec.summary       = %q{A wrapper for the Appboy REST API, track users/events/purchases, send & schedule messages}
  spec.homepage      = "godynamo.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
