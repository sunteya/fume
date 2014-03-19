require "active_support"
require "rails-i18n"
require "fume/version"

module Fume
  extend ActiveSupport::Autoload
  autoload :RailsExt
  autoload :AppSettingLoader
  autoload :RenderCache
  
  def self.load_tasks
    Dir[File.expand_path("../tasks/*.rake", __FILE__)].each { |ext| load ext }
  end
end

require File.expand_path("../fume/railtie", __FILE__)
