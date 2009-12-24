require 'fume/authlogic'
require 'fume/searchlogic'
require 'fume/simple_theme'
require 'fume/rails_ext'

module Fume
  def self.root
    @root ||= Pathname.new(File.dirname(__FILE__)).join("..")
  end
end
