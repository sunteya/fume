module Fume
  module LoggerSupport
    def self.included(base)
      base.instance_eval do
        extend ClassMethods
        include InstanceMethods
      end
    end
    
    module ClassMethods
      def logger
        @logger ||= Rails.logger || Logger.new(STDOUT)
      end
    end
    
    module InstanceMethods
      def logger
        @logger ||= self.class.logger
      end
    end
  end
end