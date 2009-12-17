class FumeGenerator < Rails::Generator::Base

  attr_accessor :gen
  delegate :source_path, :destination_path, :manifest, :after_generate, :replay, :to => :gen
  
  def initialize(runtime_args, runtime_options = {})
    super
    
    usage if args.empty?
    gen_name = args.shift
    
    gen_path = File.join(spec.path, gen_name)
    gen_spec = Fume::Gen::Spec.new(gen_name, gen_path, gen_path)
    
    @gen = gen_spec.klass.new(runtime_args, runtime_options)
  end
end


module Fume
  module Gen
    class Base < Rails::Generator::Base
      def destination_root_pathname
        Pathname.new(self.destination_root)
      end

      def source_root_pathname
        Pathname.new(self.source_root)
      end
      
      def cp_files(pattern)
        Pathname.glob(source_root_pathname.join(pattern)) do |source_path|
          relative_path = source_path.relative_path_from(source_root_pathname)
          destination_path = destination_root_pathname.join(relative_path)

          if source_path.directory?
            @manifest_util.directory relative_path unless destination_path.exist?
          else
            @manifest_util.directory relative_path.dirname unless destination_path.dirname.exist?
            @manifest_util.file relative_path.to_s, relative_path.to_s
          end
        end
      end
    end
    
    class Spec < Rails::Generator::Spec
      def class_file
        "#{path}/#{name}_gen.rb"
      end

      def class_name
        "#{name.camelize}Gen"
      end
    end
  end
end