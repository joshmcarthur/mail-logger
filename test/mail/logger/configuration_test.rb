require_relative '../../test_helper'

describe Mail::Logger::Configuration do
  describe "with Rails" do
    before do
      module ::Rails
        def self.env
          "development"
        end

        def self.root
          Pathname.new(".")
        end
      end
    end

    after do
      Object.send(:remove_const, :Rails)
    end

    subject do
      Mail::Logger::Configuration.new
    end

    it "Uses the Rails log folder as its path" do
      subject.log_path.to_s.must_equal "log"
    end

    it "Uses the Rails environment to name the file" do
      subject.log_file_name.must_equal "mail_development.log"
    end

    it "Uses the setup value for include body as include body property" do
      subject.include_body?.must_equal false
    end
  end

  describe "without Rails" do
    subject do
      Mail::Logger::Configuration.new
    end

    it "Uses the log folder relative to the current directory" do
      subject.log_path.must_equal File.expand_path("./log")
    end

    it "Uses a default string to name the file" do
      subject.log_file_name.must_equal "mail.log"
    end

    it "Uses the setup value for include body as include body property" do
      subject.include_body?.must_equal false
    end
  end
end
