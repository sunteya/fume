# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fume"

Gem::Specification.new do |s|
  s.name        = "fume"
  s.version     = Fume::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sunteya"]
  s.email       = ["Sunteya@gmail.com"]
  s.homepage    = "http://github.com/sunteya/fume"
  s.summary     = %q{a simple rails scaffold.}
  s.description = %q{a simple rails scaffold.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency "rake", "~> 0.8.7"
  
  s.add_runtime_dependency "rails", "3.0.7"
  s.add_runtime_dependency "authlogic", "3.0.2"
  s.add_runtime_dependency "formtastic", "1.2.3"
  s.add_runtime_dependency "cancan", "1.6.4"
  s.add_runtime_dependency "symbolize", "3.1.3"
  
  s.add_development_dependency "version", "1.0.0"
  # s.add_development_dependency "rspec", "~> 1.3.0"
end




