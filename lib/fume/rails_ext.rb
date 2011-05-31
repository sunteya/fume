module Fume
  module RailsExt
    def self.try_enable
      if defined? ::ActionController
        ActionController::Base.send :include, ControllerExtensions
      end
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern
      
      included do
        helper_method :public_path, :public_url
      end
      
      module InstanceMethods
        
        protected
        def redirect_to_ok_url_or_default(default)
          redirect_to params[:ok_url] || default
        end
        
        def public_url(source)
          if source.include?("://")
            source
          else
            request.protocol + request.host_with_port + url_for("#{controller.config.relative_url_root}#{source}")
          end
        end

        def public_path(source)
          if source.include?("://")
            source
          else
            url_for("#{controller.config.relative_url_root}#{source}")
          end
        end
      end
    end
    
  end
end

