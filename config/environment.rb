# Load the Rails application.
require_relative 'application'

Invoicer::Application.configure do
config.action_mailer.perform_deliveries = true

# Don't care if the mailer can't send.
config.action_mailer.raise_delivery_errors = true

config.action_mailer.perform_caching = false

config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {

  :user_name => ENV['app87031585@heroku.com'],
  :password => ENV['lt9r9scu7520'],
  :domain => "heroku.com",
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true

  # domain: "127.0.0.1",
  # authentication: "login",
  # user_name: Rails.application.secrets.email_user_name,
  # password: Rails.application.secrets.email_password
}
end


# Initialize the Rails application.
Rails.application.initialize!
