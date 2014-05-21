# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mail/logger/version'

Gem::Specification.new do |spec|
  spec.name          = "mail-logger"
  spec.version       = Mail::Logger::VERSION
  spec.authors       = ["Josh McArthur"]
  spec.email         = ["joshua.mcarthur@gmail.com"]
  spec.description   = %q{Lodges a callback with `Mail`, capturing all of the mail being sent, and logging it to it's own file, so you can simply look back through that file to see what's up. }
  spec.summary       = %q{A Rubygem to capture information about sent emails, and log them to a file all to their own!}
  spec.homepage      = "https://github.com/joshmcarthur/mail_logger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency 'mocha', '~> 0.13.3'
  spec.add_development_dependency 'minitest', '~> 4.7.3'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency "rake"
  spec.add_dependency "mail"
end
