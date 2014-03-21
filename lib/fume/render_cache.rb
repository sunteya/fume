module Fume
  module RenderCache
    def self.init!
      ::ActionController::Base.send :include, ControllerExtensions if defined? ::ActionController::Base
      ::ActiveRecord::Base.send :include, ActiveRecordExtensions if defined? ::ActiveRecord::Base
    end
    
    module ActiveRecordExtensions
      extend ::ActiveSupport::Concern
      
      module ClassMethods
        def last_updated_at
          self.maximum(:updated_at)
        end
      end
    end
    
    module ControllerExtensions
      extend ::ActiveSupport::Concern

      included do
        attr_accessor :render_cache_params
        around_filter RenderCacheFilter.new
      end

    protected
      
      def render_cache(key, options)
        params = self.render_cache_params
        
        if params[:cache]
          params[:key] = build_render_cache_key(key)
          params[:options] = options
          
          if page = RenderCachePage.load(params[:cache].read(params[:key]))
            params[:key] = nil
            
            response.charset = page.charset
            response.content_type = page.content_type
            self.response_body = page.body.html_safe
            return
          end
        end
        
        yield if block_given?
      end
      
      def build_render_cache_key(key)
        base = "render@#{params[:controller]}/#{params[:action]}.#{params[:format]}"
        key = self.key_to_string(key)
        "#{base}##{key}"
      end
      
      def key_to_string(obj)
        case obj
        when nil
          "nil!"
        when Hash
          obj.keys.sort.map { |k| "#{k}=#{self.key_to_string(obj[k])}" }.join("&")
        when Array
          obj.map { |val| self.key_to_string(val) }.join(",")
        when Time, Date
          obj.utc.iso8601
        else
          obj.to_s
        end
      end
    end
    
    class RenderCacheFilter
      def around(controller)
        controller.render_cache_params ||= {
          options: {},
          cache: nil
        }

        controller.render_cache_params[:cache] = Rails.cache if controller.class.perform_caching
        
        yield
        
        params = controller.render_cache_params
        if params[:key]
          page = RenderCachePage.new(controller.response.charset,
                                     controller.response.content_type,
                                     controller.response_body.is_a?(Array) ? controller.response_body.join : controller.response_body)
          params[:cache].write(params[:key], page.dump, params[:options])
        end
      end
    end

    class RenderCachePage < Struct.new(:charset, :content_type, :body)
      def self.load(io)
        page = YAML.load(io) if io
        page if page.is_a?(self)
      rescue Exception
        nil
      end

      def dump
        YAML.dump(self)
      end
    end

  end
end