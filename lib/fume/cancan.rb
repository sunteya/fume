module Fume
  module Cancan
    def self.try_enable
      if defined? ::CanCan
        ActionController::Base.send :include, ControllerExtensions
      end
    end

    module ControllerExtensions
      extend ActiveSupport::Concern
      
      module ClassMehtods
        
        def authorize_object(options = {})
          filter_options = options.slice(:only, :except) if options.is_a?(Hash)
          before_filter(filter_options || {}) do |controller|
            controller.send :authorize_object!, options
          end
        end
        
      end

      module InstanceMethods
        
        protected
        def authorize_object!(options)
          action = params[:action].to_sym
          case options
          when Hash
            authorize! action, options[:object]
          else
            authorize! action, options
          end
        end
        
      end
    end
    
  end
  
end


