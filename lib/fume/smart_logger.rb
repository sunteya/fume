require "logger"

module Fume
  class SmartLogger
    def self.create(name)
      case name
      when "STDOUT"
        Logger.new(STDOUT)
      when /(\w+)/
        Logger.new("log/#{$1}.log")
      when /(\w+\.\w+)/
        Logger.new("log/#{$1}")
      else
        Logger.new("log/#{Rails.env}.log")
      end
    end
  end
end