require "rubygems"
gem "gem_loader", ">= 0.1.3"
require "gem_loader"


GemLoader.setup do

  scope :runtime do
    gem "actionpack", "~> 2.3.5", :require => ["action_pack", "action_view", "action_controller"]
  end

  scope :optional do
    gem "authlogic", ">= 2.1.3"
    gem "searchlogic", ">= 2.4.12"
    gem "formtastic", ">= 0.9.7"
  end
  
  scope :test do
    gem "rspec", ">= 1.3.0", :require => nil
  end

  scope :development => [:optional, :test]

  scope :rakefile do
    gem "rake", ">= 0.8.7"
    gem "jeweler", ">= 1.4.0"
    gem "rspec", :require => "spec/rake/spectask"
  end
end
