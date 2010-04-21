require File.expand_path("../../depends.rb", __FILE__)
GemLoader.require(:runtime)

require 'fume/authlogic'
require 'fume/searchlogic'
require 'fume/simple_theme'
require 'fume/rails_ext'
require 'fume/formtastic'
require 'fume/smart_logger'
require 'fume/logger_support'
require 'fume/daemon'
require 'fume/cancan'

# module Fume
#   def self.root
#     @root ||= Pathname.new(File.dirname(__FILE__)).join("..")
#   end
# end
