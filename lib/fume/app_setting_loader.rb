module Fume
  
  class AppSettingLoader

    def self.try_enable(app)
      %w[application.extra.rb application.local.rb].each do |config_filename|
        path = Rails.root.join("config", config_filename)
        require path if File.exists?(path)
      end
    end
    
  end
end