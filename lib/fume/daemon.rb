require "fileutils"

module Fume
  module Daemon
    attr_accessor :pid_file_path
    
    def initialize
      self.pid_file_path = Rails.root.join("tmp", "pids", "#{self.class.name}.pid")
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
      hold_pid_file
      register_trap
      
      @run = true
      
      while @run
        self.execute
      end
    end
    
    def stop
      @run = false
      remove_pid_file
    end
  end
end