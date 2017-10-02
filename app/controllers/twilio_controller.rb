class TwilioController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def twiml
    response = Twilio::TwiML::VoiceResponse.new
    response.play(url: site_url('/messages/1.mp3'))

    render xml: response.to_s
  end

  def callback
    render json: '{success: true}'
  end

  private

  def site_url(path)
    URI(request.url).tap { |uri| uri.path = path }.to_s
  end
end