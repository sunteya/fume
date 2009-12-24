require 'fume/authlogic'
require 'fume/searchlogic'
require 'fume/simple_theme'
require 'fume/rails_ext'
require 'fume/formtastic'

module Fume
  def self.root
    @root ||= Pathname.new(File.dirname(__FILE__)).join("..")
  end
end
