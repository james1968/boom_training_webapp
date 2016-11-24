require 'rubygems'
require 'twilio-ruby'

class Text

  def initialize
    @account_sid = Rails.application.secrets.TWILIO_ACCOUNT_SID
    @auth_token = Rails.application.secrets.TWILIO_AUTH_TOKEN
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text(recepient,body)
    if recepient.present?
    message = @client.account.messages.create({
      body: body,
      to:  recepient,
      from:  "+441432233208"})
    end
  end
end
