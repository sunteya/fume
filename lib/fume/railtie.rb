require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume.initialize', :after => :after_initialize do |app|
      RailsExt.init!
      RenderCache.init!
    end
    
    rake_tasks do
      Fume.load_tasks
    end
    
  end
end
