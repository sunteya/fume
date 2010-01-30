require "spec_helper"

describe Fume::SmartLogger do
  before(:each) do
    @logger = Logger.new(STDOUT)
  end
  
  it "should be create STDOUT logger" do
    Logger.should_receive(:new).with(STDOUT).and_return(@logger)
    result = SmartLogger.create("STDOUT")
    result.should be_eql @logger
    result.level.should be_eql Logger::DEBUG
  end
  
  it "should be create log file logger" do
    Logger.should_receive(:new).with(Rails.root.join("log", "file.log")).and_return(@logger)
    result = SmartLogger.create("file", Logger::INFO)
    result.should be_eql @logger
    result.level.should be_eql Logger::INFO
  end
  
  it "should be create log file logger with ext" do
    Logger.should_receive(:new).with(Rails.root.join("log", "file.log")).and_return(@logger)
    SmartLogger.create("file.log").should be_eql @logger
  end
  
  it "should be create log file by Rails env" do
    Logger.should_receive(:new).with(Rails.root.join("log", "development.log")).and_return(@logger)
    Rails.env = "development"
    SmartLogger.create(nil).should be_eql @logger
  end
end
