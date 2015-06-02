# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/http_status/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-http_status'
  spec.version       = Ruboty::HttpStatus::VERSION
  spec.authors       = ['Takahiro OKUMURA']
  spec.email         = ['hfm.garden@gmail.com']

  spec.summary       = 'Ruboty plugin: Display HTTP Status Codes'
  spec.description   = 'Ruboty plugin: Display HTTP Status Codes'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'
  spec.add_runtime_dependency 'nokogiri'
  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'simplecov'
end
