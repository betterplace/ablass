Ablass::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Where the betterplace platform lives:
  config.betterplace_platform_url = 'http://www.betterplace.dev'

  # What this application knows about where it lives:
  config.platform_host             = 'localhost:3000'

  # betterplace API root
  config.betterplace_api = -> path, locale: I18n.locale {
    "http://api.betterplace.dev/%s/api_v4/%s" % [ locale, path.sub(/\A\/*/, '') ]
  }

  #config.asset_host = 'http://localhost:3000'
end
