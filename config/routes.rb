Rails.application.routes.draw do
  get '/mail_skater', to: 'mail#send_mail'
end
