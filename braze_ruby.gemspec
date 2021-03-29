require_relative 'lib/braze_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'braze_ruby'
  spec.version       = BrazeRuby::VERSION
  spec.authors       = ['Josh Nussbaum', 'Hugo Bastien', 'Justin Boltz', 'Jonathan Allured']
  spec.email         = %w[josh@godynamo.com hugo@godynamo.com justin.boltz@takl.com jon.allured@gmail.com]

  spec.summary       = 'A wrapper gem for the Braze REST API.'
  spec.description   = 'Wrapper for Braze API'
  spec.homepage      = 'https://github.com/jonallured/braze_ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'

  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
