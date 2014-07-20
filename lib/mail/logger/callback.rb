class Mail::Logger::Callback
  def self.delivered_email(email)
    if Mail::Logger.configuration.message_inspect &&
        Mail::Logger.configuration.message_inspect.is_a?(Proc)
      Mail::Logger.logger.info Mail::Logger.configuration.message_inspect.call(email)
    else
      Mail::Logger.logger.info email.inspect
    end
  end
end

require 'mail'
Mail.register_observer(Mail::Logger::Callback)
