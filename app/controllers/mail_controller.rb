require 'sendgrid-ruby'
include SendGrid

class MailController < ApplicationController
  def send_mail
    from = SendGrid::Email.new(email: 'doods@skate_spotting')
    to = SendGrid::Email.new(email: params["email"])
    subject = 'Welcome to Skate Spotting'
    content = SendGrid::Content.new(type: 'text/html', value: '<html><body>Thank You For Choosing Skate Spotting</body></html>')
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    render json: {'SUCCESS': 'Your Mail Has Been Sent'}
  end
end
