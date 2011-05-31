module Fume
  class Railtie < ::Rails::Railtie
    initializer 'fume.initialize', :after => :after_initialize do
      Fume.constants.each do |name|
        ext_module = Fume.const_get(name)
        ext_module.try_enable if ext_module.respond_to?(:try_enable)
      end
    end
  end
end
