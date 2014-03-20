# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fume/version'

Gem::Specification.new do |spec|
  spec.name          = "fume"
  spec.version       = Fume::VERSION
  spec.authors       = ["sunteya"]
  spec.email         = ["sunteya@gmail.com"]
  spec.summary       = %q{some simple rails extentions.}
  spec.description   = %q{some simple rails extentions.}
  spec.homepage      = "https://github.com/sunteya/fume"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.2.13"
  spec.add_dependency "rails-i18n", ">= 0.7.2"
  spec.add_dependency "hashie", ">= 1.2.0"
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec-rails", "~> 2.14.1"
  spec.add_development_dependency "coveralls"

  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "combustion", "~> 0.5.1"
end





