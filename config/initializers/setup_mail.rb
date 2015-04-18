ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => "callumshorty@hotmail.com",
    :password  => "tQkmQ3Ps5E_YIHbOGviwDA",
    :domain    => 'heroku.com'
  }

MandrillMailer.configure do |config|
  config.api_key = "tQkmQ3Ps5E_YIHbOGviwDA"
end