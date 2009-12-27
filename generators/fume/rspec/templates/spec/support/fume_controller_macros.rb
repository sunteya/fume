module FumeControllerMacros
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    
    class ActionMethod < Struct.new(:method, :action)
      def to_proc
        eval <<-EOV
          Proc.new do |params|
            #{method} "#{action}", params
          end
        EOV
      end
    end
    
    %w{ get post put delete }.each do |name|
      define_method(name) do |*actions|
        [ actions ].flatten.map do |action|
          ActionMethod.new(name, action)
        end
      end
    end
    
    %w{ be_success be_redirect be_invalid }.each do |be_method|
      define_method "it_should_#{be_method}_for" do |action_methods, &block|
        action_methods.each do |action_method|
          it "should #{be_method} for #{action_method.method} :#{action_method.action} action" do
            if block_given?
              result = self.instance_exec(&block)
              params = result if result.is_a? Hash
    
              self.instance_exec(params, &action_method)
              response.should send(be_method)
            end
          end
        end
      end
    end
    
    def it_should_be_like_restful_resources(options = {}, &block)
      actions = [ :index, :new, :create, :show, :edit, :update, :destroy ]
      actions &= [ options[:only] ].flatten if options[:only]
      actions -= [ options[:except] ].flatten if options[:except]

      if actions.include?(:index)
        it_should_be_success_for get(:index) do
          params = instance_exec(&block)
        end
      end

      if actions.include?(:new)
        it_should_be_success_for get(:new) do
          params = instance_exec(&block)
        end
      end

      if actions.include?(:create)
        it_should_be_redirect_for post(:create) do
          params = instance_exec(&block)
          params.merge(params.delete(:valid_attributes))
        end

        it_should_be_invalid_for post(:create) do
          params = instance_exec(&block)
          params.merge(params.delete(:invalid_attributes))
        end
      end

      if actions.include?(:edit)
        it_should_be_success_for get(:edit) do
          params = instance_exec(&block)
        end
      end

      if actions.include?(:update)
        it_should_be_redirect_for put(:update) do
          params = instance_exec(&block)
          params.merge(params.delete(:valid_attributes))
        end

        it_should_be_invalid_for put(:update) do
          params = instance_exec(&block)
          params.merge(params.delete(:invalid_attributes))
        end
      end

      if actions.include?(:destroy)
        it_should_be_redirect_for delete(:destroy) do
          params = instance_exec(&block)
        end
      end
    end
    
  end # ClassMethods

  module InstanceMethods
    def be_invalid(*args)
      be_success(*args)
    end
  end

end