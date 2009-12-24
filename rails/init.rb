require File.join(File.dirname(__FILE__), *%w[.. lib fume])

::Fume.constants.each do |module_name|
  module_class = Fume.const_get(module_name)
  if module_class.respond_to? :enable
    module_class.enable
  end
end