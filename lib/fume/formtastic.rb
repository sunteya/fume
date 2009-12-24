module Fume
  module Formtastic
    
    def self.enable
      return unless defined? ::Formtastic
      
      ::Formtastic::SemanticFormBuilder.class_exec do
        alias_method :humanized_attribute_name_without_instance, :humanized_attribute_name
        
        def humanized_attribute_name(method)
          if @object && @object.respond_to?(:human_attribute_name)
            @object.human_attribute_name(method.to_s)
          else
            humanized_attribute_name_without_instance(method)
          end
        end
      end

    end
  end
end

