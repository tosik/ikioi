# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ikioi/version'

Gem::Specification.new do |spec|
  spec.name          = "ikioi"
  spec.version       = Ikioi::VERSION
  spec.authors       = ["Toshiyuki Hirooka"]
  spec.email         = ["toshi.hirooka@gmail.com"]
  spec.description   = %q{Fetches '2ch ikioi'}
  spec.summary       = %q{Fetches '2ch ikioi'}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
