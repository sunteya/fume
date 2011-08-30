module Fume
  module RailsExt
    def self.try_enable(app)
      if defined? ::ActionController
        ActionController::Base.send :include, ControllerExtensions
      end
      
      if defined? ::ActiveRecord
        ::ActiveRecord::Base.send :include, ActiveRecordExtensions
      end
    end
    
    module ActiveRecordExtensions
      extend ActiveSupport::Concern
      
      module ClassMethods
        def last_updated_at
          self.reorder("").select("MAX(#{self.table_name}.updated_at) AS updated_at").first.try(:updated_at)
        end
      end
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern
      
      included do
        helper_method :public_path, :public_url
      end
      
      module ClassMethods
        def action_attr_accessor(syms, options = {})
          [ syms ].flatten.each do |sym|
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

