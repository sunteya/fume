module Fume
  module Searchlogic

    def self.enable
      ActionController::Base.send :helper, RailsHelpers
      ::Searchlogic::Search.send :include, SearchExtensions::InstanceMethods
    end

    module SearchExtensions
      module InstanceMethods
        def human_attribute_name(name)
          klass.human_attribute_name(name)
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