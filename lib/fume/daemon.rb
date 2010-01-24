require "fileutils"

module Fume
  module Daemon

    def self.included(base)
      base.instance_eval do
        include LoggerSupport
        
        include InstanceMethods
        extend ClassMethods
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      attr_accessor :pid_file_path

      def initialize
        self.pid_file_path = Rails.root.join("tmp", "pids", "#{daemon_name}.pid")
      end

      def daemon_name
        self.class.name
      end

      def register_trap
        %w{TERM INT HUP}.each do |signal_name| 
          Signal.trap(signal_name) do
            self.stop
          end
        end
      end

      def pid_file_path
        ENV["PID_FILE"] || @pid_file_path
      end

      def hold_pid_file
        File.open(self.pid_file_path, "w") << Process.pid if self.pid_file_path
      end

      def remove_pid_file
        FileUtils.rm(pid_file_path, :force => true) if self.pid_file_path
      end

      def start
        logger.info { "Daemon: #{daemon_name} starting ..." }
        hold_pid_file
        register_trap

        @run = true

        while @run
          self.execute
        end
        logger.info { "Daemon: #{daemon_name} stoped ..." }
      end

      def stop
        @run = false
        remove_pid_file
      end
    end
  end
end