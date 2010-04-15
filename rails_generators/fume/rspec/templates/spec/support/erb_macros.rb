module ErbMacros
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  end
  
  module InstanceMethods
    def render_template(template)
      erb = ERB.new(template.read)
      tmp_file = Tempfile.new("erb")
      File.open(tmp_file.path, "wb") { |f| f.write(erb.result(binding)) } 
      tmp_file
    end
  end
end