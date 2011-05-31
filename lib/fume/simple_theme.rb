module Fume
  module SimpleTheme
    
    def self.try_enable
      ActionController::Base.send :include, ControllerExtensions
    end
    
    module ControllerExtensions
      extend ActiveSupport::Concern
      
      included do
        helper_method :sec_nav, :main_nav
        helper RailsHelpers
      end
      
      module ClassMethods
        def sec_nav_highlight(name)
          class_eval do 
            before_filter { |c| c.instance_variable_set(:@sec_nav, name) }
          end
        end

        def main_nav_highlight(name)
          class_eval do 
            before_filter { |c| c.instance_variable_set(:@main_nav, name) }
          end
        end
      end
      
      module RailsHelpers
        
        def sec_nav(name, options = {}, &block)
          if @sec_nav == name
            if options[:class]
              options[:class] += " active"
            else
              options[:class] = "active"
            end
          end
          content = capture(&block)
          content_tag(:li, content, options)
        end

        def main_nav(name, options = {}, &block)
          if @main_nav == name
            if options[:class]
              options[:class] += " active"
            else
              options[:class] = "active"
            end
          end
          content = capture(&block)
          content_tag(:li, content, options)
        end
      end
      
    end
  end
end