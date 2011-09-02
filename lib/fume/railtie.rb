require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume.initialize', :after => :after_initialize do |app|
      Fume.constants.each do |name|
        ext_module = Fume.const_get(name)
        
        if ext_module.respond_to?(:try_enable)
          ext_module.try_enable(app)
        end
      end
    end
    
    rake_tasks do
      Fume.load_tasks
    end
    
  end
end
