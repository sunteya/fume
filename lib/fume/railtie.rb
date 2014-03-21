require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume' do |app|
      RailsExt.init!
      RailsControllerExts.init!
      RenderCache.init!
    end
    
    rake_tasks do
      Fume.load_tasks
    end
  end
end
