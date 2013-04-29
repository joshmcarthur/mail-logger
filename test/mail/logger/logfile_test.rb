require_relative '../../test_helper'

describe Mail::Logger::Logfile do
  subject do
    Mail::Logger::Logfile.new
  end

  it "Inherits from Logger" do
    subject.class.superclass.must_equal ::Logger
  end

  it "derives its path from the config" do
    Mail::Logger.configuration.expects(:log_path).returns(File.expand_path("./test/log"))
    Mail::Logger::Logfile.new
  end

  it "Derives its filename from the config" do
    Mail::Logger.configuration.expects(:log_file_name).returns("mail.log")
    Mail::Logger::Logfile.new
  end
end

