module Fume
  module RailsExt
    
    def self.try_enable
      ActionController::Base.send :include, ControllerExtensions::InstanceMethods
      ActionController::Base.send :helper, RailsHelpers
    end
    
    module ControllerExtensions
      module InstanceMethods
        
        protected
        def redirect_to_ok_url_or_default(default)
          redirect_to params[:ok_url] || default
        end
      end
    end
    
    module RailsHelpers
      def public_path(source)
        url_for("#{ActionController::Base.relative_url_root}#{source}")
      end
      
      def translate_attribute(klass, attribute_name)
        klass.human_attribute_name(attribute_name)
      end

      alias :ta :translate_attribute
    end
  end
end

