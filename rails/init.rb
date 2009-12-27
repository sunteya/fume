require File.join(File.dirname(__FILE__), *%w[.. lib fume])

::Fume.constants.each do |module_name|
  module_class = Fume.const_get(module_name)
  if module_class.respond_to? :try_enable
    module_class.try_enable
  end
end