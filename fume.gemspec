# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fume"
  s.version     = File.read(File.expand_path("../VERSION", __FILE__)).chomp
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
  
  
  # rails
  s.add_runtime_dependency "rails", "3.0.9"
  
  # library
  s.add_runtime_dependency "timeliness", "~> 0.3.4"
  s.add_runtime_dependency "hashie", "~> 1.1.0"
  s.add_runtime_dependency "addressable", "~> 2.2.6"
  
  # rails plugin
  s.add_runtime_dependency "authlogic", "3.0.3"
  s.add_runtime_dependency "formtastic", "1.2.4"
  s.add_runtime_dependency "cancan", "1.6.5"
  s.add_runtime_dependency "symbolize", "3.2.0"
  s.add_runtime_dependency "meta_search", "1.0.6"
  s.add_runtime_dependency "kaminari", "0.12.4"
  
  
  # development
  s.add_development_dependency "version"
  # s.add_development_dependency "rspec", "~> 1.3.0"
end




