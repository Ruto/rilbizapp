class TwilioTextMessenger
  attr_reader :message

  def initialize(message, phone)
    @message = message
    @phone = phone
  end

  def call
    client = Twilio::REST::Client.new
      client.messages.create({
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: @phone,
        body: message
      })
  end
end
