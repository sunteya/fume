module Fume
  module Cancan
    def self.try_enable
      if defined? ::CanCan
        ActionController::Base.send :include, ControllerExtensions
      end
    end

    module ControllerExtensions
      def self.included(base)
        base.send :extend, ClassMehtods
        base.send :include, InstanceMethods
      end
      
      module ClassMehtods
        def authorize_namespace(options = {})
          before_filter(:authorize_namespace, options.slice(:only, :except))
          write_inheritable_hash(:authorize_namespace, options)
        end
      end

      module InstanceMethods
        protected
        def authorize_namespace
          options = self.class.read_inheritable_attribute(:authorize_namespace)
          authorize!(params[:action].to_sym, options[:namespace])
        end
      end
    end
    
  end
end


