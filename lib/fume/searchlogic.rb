module Fume
  module Searchlogic

    def self.try_enable
      if defined? ::Searchlogic
        ActionController::Base.send :helper, RailsHelpers
        ::Searchlogic::Search.send :include, SearchExtensions::InstanceMethods
        ::Searchlogic::Search.send :extend, SearchExtensions::ClassMethods
      end
    end

    module SearchExtensions
      module ClassMethods
        def human_name
          "Search"
        end
      end
      
      module InstanceMethods

        def human_attribute_name(name)
          klass.human_attribute_name(name)
        end
        
        def new_record?
          true
        end
      end
    end

    module RailsHelpers
      def i18n_order(search, options = {}, html_options = {})
        attribute_name = options[:attr] || options[:by]
        options[:as] ||= translate_attribute(search.klass, attribute_name)
        order(search, options, html_options)
      end
    end
  end
end

