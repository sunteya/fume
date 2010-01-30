require "logger"

module Fume
  class SmartLogger
    def self.create(name, log_level = Logger::DEBUG)
      logger = case name
      when "STDOUT"
        Logger.new(STDOUT)
      when /(\w+)/
        Logger.new(Rails.root.join("log", "#{$1}.log"))
      when /(\w+\.\w+)/
        Logger.new(Rails.root.join("log", $1))
      else
        Logger.new(Rails.root.join("log", "#{Rails.env}.log"))
      end
      logger.level = log_level
      logger
    end
  end
end