require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'test/unit'
require 'mocha/setup'
require 'mail_logger'

Mail::Logger.configure do |config|
  config.log_path = File.expand_path("./test/log")
end

unless File.directory?("./test/log")
  require 'fileutils'
  FileUtils.mkdir("./test/log")
end

Bundler.require(:default)

