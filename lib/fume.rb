require "active_support"
require "rails-i18n"

module Fume
  VERSION = File.read(File.expand_path("../../VERSION", __FILE__)).chomp
  
  extend ActiveSupport::Autoload
  autoload :RailsExt
  autoload :SimpleNav
  autoload :AppSettingLoader
  autoload :RenderCache
  
  def self.load_tasks
    Dir[File.expand_path("../tasks/*.rake", __FILE__)].each { |ext| load ext }
  end
end

require File.expand_path("../fume/railtie", __FILE__)
