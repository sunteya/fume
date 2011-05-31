require "active_support"

# rails 
require File.expand_path("../fume/railtie", __FILE__)

module Fume
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp
end

module Fume
  extend ActiveSupport::Autoload
  
  autoload :Authlogic
  autoload :RailsExt
  autoload :Cancan
  autoload :SimpleTheme
end
