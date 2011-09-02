require "active_support"
require File.expand_path("../fume/railtie", __FILE__)

# 3rd gems
require "rails-i18n"


module Fume
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp
end

module Fume
  extend ActiveSupport::Autoload
  
  autoload :Authlogic
  autoload :RailsExt
  autoload :Cancan
  autoload :SimpleNav
  autoload :AppSettingLoader
  autoload :RenderCache
end
