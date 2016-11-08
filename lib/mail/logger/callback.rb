class Mail::Logger::Callback
  PROPERTIES = %i(from to cc bcc subject message_id mime_version content_type content_transfer_encoding)

  def self.delivered_email(email)
    text = PROPERTIES.map do |prop|
      "#{key_camelize(prop)}: #{value_textize(email.send(prop))}"
    end.join("\n") << "\n"

    if Mail::Logger.configuration.include_body?
      bodies = email.body.parts.empty? && [ email.body ] || email.body.parts
      text << "Body:\n" << bodies.map(&:to_s).join("\n")
    end

    Mail::Logger.logger.info(text)
  end

  def self.key_camelize key
    key.to_s.split(/_+/).map { |t| t[0].upcase + t[1..-1] }.join('-')
  end

  def self.value_textize value
    value.is_a?(Array) && value.join(", ") || value
  end
end

require 'mail'
Mail.register_observer(Mail::Logger::Callback)
