# MailLogger

[![Build Status](https://travis-ci.org/joshmcarthur/mail_logger.png?branch=master)](https://travis-ci.org/joshmcarthur/mail_logger)

> Please note: There's another project around called [**mail_logger**](https://rubygems.org/gems/mail_logger), which records details of mail to the database via ActiveRecord, instead of a log file (which is what this project does). While I certainly didn't intend to infringe, the other project hasn't been updated in a few years, so I'm sticking with this name.

You know how you're looking through your logs to see how your mailing is doing, and after all that request rubbish, you just can't see that **Sent mail** stuff? Annoying, right?

MailLogger to the rescue! It lodges a callback with `Mail`, capturing all of the mail being sent, and logging it to it's own file, so you can simply look back through that file to see what's up. Easy peasy!

I could be a pain and require Rails here, but I don't. If you are using Rails, then this gem should put things in the right place: `#{Rails.root}/log/mail_{development,etc}.log` - no extra work necessary. If you are not using Rails, then the gem will place the log file in `./log` - wherever that may be.

Default paths getting you down? Not to worry, this gem is configurable!

``` ruby
Mail::Logger.configure do |config|
  config.log_path = "Whatever you want"
  config.log_file_name = "all my emails.log"
end
```

(If you're using Rails, this belongs in `config/initializers/mail_logger.rb`)

## Installation

Add this line to your application's Gemfile:

    gem 'mail_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_logger
    
   

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
