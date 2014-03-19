# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'fume/version'

Gem::Specification.new do |spec|
  spec.name          = "fume"
  # spec.version       = Fume::VERSION
  spec.version       = File.read(File.expand_path("../VERSION", __FILE__)).chomp
  spec.authors       = ["sunteya"]
  spec.email         = ["sunteya@gmail.com"]
  spec.summary       = %q{a simple rails scaffold.}
  spec.description   = %q{a simple rails scaffold.}
  spec.homepage      = "https://github.com/sunteya/fume"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.2.13"
  spec.add_dependency "rails-i18n", ">= 0.7.2"
  spec.add_dependency "hashie", ">= 1.2.0"
  
  spec.add_development_dependency "version"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end





