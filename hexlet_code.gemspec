# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name          = 'hexlet_code'
  spec.version       = HexletCode::VERSION
  spec.authors       = ['Ivan Safronov']
  spec.email         = ['safrio@gmail.com']

  spec.summary       = 'Form generator'
  spec.description   = 'Hexlet rails education excersise #1'
  spec.homepage      = 'https://github.com/safrio/rails-project-lvl1'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.required_ruby_version = '>= 3.0.0'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.files = Dir['{lib}/**/*'] + ['Rakefile', 'README.md']

  spec.add_dependency 'rake'
  spec.add_dependency 'slim'

  spec.add_development_dependency 'minitest'
end
