# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mic/version'

Gem::Specification.new do |spec|
  spec.name          = "mic"
  spec.version       = Mic::VERSION
  spec.authors       = ["Javier Vidal"]
  spec.email         = ["javier@javiervidal.net"]
  spec.summary       = 'ISO 10383 - Market Identifier Codes (MIC)'
  spec.description   = 'Market Identifier Codes (MIC). The ISO 10383 specifies a universal method of identifying exchanges, trading platforms, regulated or non-regulated markets and trade reporting facilities as sources of prices and related information in order to facilitate automated processing.'
  spec.homepage      = "https://github.com/javiervidal/mic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
