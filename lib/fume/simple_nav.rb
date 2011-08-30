require "hashie"

module Fume
  module SimpleNav
    
    def self.try_enable(app)
      ActionView::Base.send :include, HelperExtensions
    end
    
    module HelperExtensions
      
      def simple_nav(attr_reader_name)
        value = self.send(attr_reader_name)
        tag = SimpleNavTag.new({
          :helper => self,
          :value => value,
          :active_class => "active"
        })

        if block_given?
          yield tag
          return nil
        else
          return tag
        end
      end
      
      class SimpleNavTag < Hashie::Mash
        
        def li_tag(value, options = {}, &block)
          self.content_tag(value, :li, options, &block)
        end

        def content_tag(value, tag_name, options = {}, &block)
          if value == self.value
            if options[:class]
              options[:class] += " #{self.active_class}"
            else
              options[:class] = "#{self.active_class}"
            end
          end

          helper.content_tag(tag_name, options, &block)
        end
      end
  
    end
  end
end