module Fume
  module RenderCache
    
    def self.try_enable(app)
      if defined? ::ActionController
        ActionController::Base.send :include, ControllerExtensions
      end
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern

      included do
        attr_accessor :render_cache_params
        around_filter RenderCacheFilter.new
      end

      module InstanceMethods
        protected
        def render_cache_by_scope(scope, options = {}, &block)
          last_updated_at = scope.last_updated_at
          sql = scope.to_sql
          key = { :sql => sql, :last_updated_at => last_updated_at }
          render_cache(key, options, &block)
        end

        def render_cache(key, options = {})
          key = build_render_cache_key(key)
          cache = Rails.cache

          fragment = cache.read(key)
          if fragment
            response.charset = fragment[:charset]
            response.content_type = fragment[:content_type]
            self.response_body = fragment[:body].html_safe
          else
            yield if block_given?

            self.render_cache_params = {
              :key => key,
              :options => options,
              :cache => cache
            }
          end
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
            obj.to_s(:db)
          else
            obj.to_s
          end
        end

      end
    end
    
    class RenderCacheFilter
      def filter(controller)
        yield
        params = controller.render_cache_params || {}
        if params[:key]
          content = {
            :charset => controller.response.charset,
            :content_type => controller.response.content_type,
            :body => controller.response_body.is_a?(Array) ? controller.response_body.join : controller.response_body
          }
          params[:cache].write(params[:key], content, params[:options])
        end
      end
    end

  end
end