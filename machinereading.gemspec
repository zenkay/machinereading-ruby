# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'machinereading/version'

Gem::Specification.new do |spec|
  spec.name          = "machinereading"
  spec.version       = Machinereading::VERSION
  spec.authors       = ["Andrea Mostosi"]
  spec.email         = ["andrea.mostosi@zenkay.net"]
  spec.summary       = %q{Gem for machinereading.com}
  spec.description   = %q{Gem for machinereading.com}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", '~> 0.9', '>= 0.9.0'
  spec.add_dependency "faraday_middleware", '~> 0.9', '>= 0.9.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 2.12"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "vcr", "~> 2.4"
  spec.add_development_dependency "webmock", "~> 1.17"
  spec.add_development_dependency "simplecov", "~> 0.8"
  spec.add_development_dependency "coveralls", "~> 0.7"
end
