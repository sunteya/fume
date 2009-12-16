class FumeGenerator < Rails::Generator::Base


  def initialize(runtime_args, runtime_options = {})
    super
    
    usage if args.empty?
    gen_name = args.shift
    
    gen_path = File.join(spec.path, gen_name)
    gen_spec = Fume::Gen::Spec.new(gen_name, gen_path, gen_path)
    
    @gen = gen_spec.klass.new(runtime_args, runtime_options)
  end

  def manifest
    @gen.manifest
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