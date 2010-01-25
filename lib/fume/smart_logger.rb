require "logger"

module Fume
  class SmartLogger
    def self.create(name)
      case name
      when "STDOUT"
        Logger.new(STDOUT)
      when /(\w+)/
        Logger.new(Rails.root.join("log", "#{$1}.log"))
      when /(\w+\.\w+)/
        Logger.new(Rails.root.join("log", $1))
      else
        Logger.new(Rails.root.join("log", "#{Rails.env}.log"))
      end
    end
  end
end