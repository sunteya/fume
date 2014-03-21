module Fume
  module RailsControllerExts
    
    def self.init!
      ::ActionController::Base.send :include, ControllerExtensions if defined? ::ActionController::Base
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern
      
      included do
        helper_method :public_path, :public_url
      end
      
      module ClassMethods
      end
      
    protected
      def redirect_to_ok_url_or_default(default)
        redirect_to params[:ok_url] || default
      end
      
      def public_url(source)
        if source.include?("://")
          source
        else
          "#{request.protocol}#{request.host_with_port}#{public_path(source)}"
        end
      end

      def public_path(source)
        url = url_for(source)
        return url if url.include?("://")
        
        if url.start_with?(request.script_name)
          url
        else
          "#{request.script_name}#{url}"
        end
      end
    end
  end
end

