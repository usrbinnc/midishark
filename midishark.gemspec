# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'midishark/version'

Gem::Specification.new do |spec|
  spec.name          = "midishark"
  spec.version       = Midishark::VERSION
  spec.authors       = ["David Balatero"]
  spec.email         = ["dbalatero@gmail.com"]
  spec.summary       = %q{Provides a library for creating network -> MIDI translations.}
  spec.description   = %q{Provides a library for creating network -> MIDI translations.}
  spec.homepage      = "https://github.com/usrbinnc/midishark"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
