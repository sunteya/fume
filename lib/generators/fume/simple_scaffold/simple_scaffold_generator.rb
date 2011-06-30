module Fume

  class SimpleScaffoldGenerator < Rails::Generators::NamedBase
    include Rails::Generators::ResourceHelpers
    source_root File.expand_path('../templates', __FILE__)
    
    argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
    
    def create_controller_files
      template 'controller.rb', File.join('app/controllers', class_path, "#{controller_file_name}_controller.rb")
    end
    
    def copy_view_files
      %w(index new _form edit).each do |view|
        filename = "#{view}.html.erb"
        template filename, File.join("app/views", controller_file_path, filename)
      end
    end
    
    protected
    # model
    def plural_model_name
      singular_model_name.pluralize
    end
    
    def singular_model_name
      model_class_name.underscore
    end
    
    def model_class_name
      @model_class_name ||= file_name.camelize
    end
    
    # path
    def resources_path_prefix
      (class_path + [plural_model_name]).join('_')
    end

    def resource_path_prefix
      (class_path + [singular_model_name]).join('_')
    end
  end

end
