require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume' do |app|
      RailsControllerExts.init!
      RailsHelperExts.init!
      RenderCache.init!
    end
    
    rake_tasks do
      Fume.load_tasks
    end
  end
end
