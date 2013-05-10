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
  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "rails-i18n", "~> 0.7.2"
  s.add_dependency "hashie", ">= 1.2.0"
  
  # development
  s.add_development_dependency "version"
end




