require "active_support"
require File.expand_path("../fume/railtie", __FILE__)

# 3rd gems
require "rails-i18n"


module Fume
  extend ActiveSupport::Autoload
  
  autoload :Authlogic
  autoload :RailsExt
  autoload :Cancan
  autoload :SimpleNav
  autoload :AppSettingLoader
  autoload :RenderCache
  
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp
  
  def self.load_tasks
    Dir[File.expand_path("../tasks/*.rake", __FILE__)].each { |ext| load ext }
  end
  
end
