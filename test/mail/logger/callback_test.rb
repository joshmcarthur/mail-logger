require_relative "../../test_helper"

describe Mail::Logger::Callback do
  before do

  end

  describe "#delivered_email" do
    subject do
      mail_object
    end

    it "Logs the email" do
      Mail::Logger.logger.expects(:info).with(subject.inspect).returns(true)
      Mail::Logger::Callback.delivered_email(subject)
    end
  end

  describe "Callback registration" do
    before do
      Mail.defaults do
        delivery_method :test
      end
    end

    it "Calls our callback method from Mail" do
      Mail::Logger::Callback.stubs(:delivered_email).returns(true)
      deliver_email
    end
  end

  def deliver_email
    Mail.new do
      from "tester@example.com"
      to   "tester@example.com"
      subject "Test"
      body "Test"
    end.deliver
  end

  def mail_object
    Mail.new
  end
end