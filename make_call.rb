require 'twilio-ruby'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

@call = @client.calls.create(
  from: ENV['TWILIO_SMS_FROM'],   # From your Twilio number
  to: ENV['TWILIO_SMS_TO'],     # To any number
  # Fetch instructions from this URL when the call connects
  url: 'https://twilio-reminder-app.curiousattemptbunny.com/twilio/twiml',
  status_callback: 'https://twilio-reminder-app.curiousattemptbunny.com/twilio/callback'
)
