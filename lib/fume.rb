require "active_support"

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
