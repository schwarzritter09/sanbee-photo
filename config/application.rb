require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SanbeePhoto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.assets.compile = true
    config.assets.digest = true
    config.serve_static_files = true
    
    # use tweet bot
    config.tweet_consumer_key = "RLAMJWgTVdUFeHh4mx7rNJSA3"
    config.tweet_consumer_secret = "zxiO9bqGQe9qZ7dIg3LxMhRwpC6P8xlK7jV08XhYKvwVyapO1X"
    config.tweet_access_token = "4042896974-kzFFWkVsJ4rhpGJvDCkvdpZDasxGyHeOgH3oXcD"
    config.tweet_access_token_secret = "ximjxZRp5E8yCVwpV4W3FTMbvgPYssVt7lYQoOeUTA4LS"
  end
end
