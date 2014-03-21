require "rails/railtie"

module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume' do |app|
      ActiveSupport.on_load(:action_controller) { include ControllerExts }
      ActiveSupport.on_load(:action_view) { include HelperExts }
      ActiveSupport.on_load(:active_record) { include ActiveRecordExts }

      RenderCache.init!
    end
    
    rake_tasks do
      Fume.load_tasks
    end
  end
end
