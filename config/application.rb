require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MOD5BACKEND
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

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
end
