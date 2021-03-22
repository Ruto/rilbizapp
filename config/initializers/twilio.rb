Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID'] #Rails.application.secrets.twilio_account_sid
  config.auth_token = ENV['TWILIO_AUTH_TOKEN'] #Rails.application.secrets.twilio_auth_token
end
