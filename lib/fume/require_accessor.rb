module Fume
  module RequireAccessor
    extend ActiveSupport::Concern

    module ClassMethods
      def require_accessor(*names)
        names.each do |name|
          field_name = "#{name}_required"
          class_eval(<<-EOS, __FILE__, __LINE__ + 1)
            def require_#{name}!
              @#{field_name} = true
            end

            def #{field_name}?
              !!@#{field_name}
            end
          EOS
        end
      end
    end
  end
end