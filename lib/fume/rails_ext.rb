module Fume
  module RailsExt
    
    def self.init!(app)
      if defined? ::ActionController::Base
        ::ActionController::Base.send :include, ControllerExtensions
      end
      
      if defined? ::ActionView::Base
        ::ActionView::Base.send :include, HelperExtensions
      end
    end
    
    module HelperExtensions
      def ok_url_tag
        hidden_field_tag "ok_url", params[:ok_url] if !params[:ok_url].blank?
      end
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern
      
      included do
        helper_method :public_path, :public_url
      end
      
      module ClassMethods
        def action_attr_accessor(*args)
          options = args.extract_options!
          [ args ].flatten.compact.each do |sym|
            class_eval(<<-EOS, __FILE__, __LINE__ + 1)
              def self.#{sym}(obj)
                before_filter { |c| c.send(:#{sym}=, obj) }
              end
              
              attr_accessor :#{sym}
              helper_method :#{sym}, :#{sym}=
            EOS
          end
        end
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

