require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume' do |app|
      ControllerExts.init!
      HelperExts.init!
      ::ActiveRecord::Base.send :include, RequireAccessor if defined? ::ActiveRecord::Base
      
      
      RenderCache.init!
    end
    
    rake_tasks do
      Fume.load_tasks
    end
  end
end
