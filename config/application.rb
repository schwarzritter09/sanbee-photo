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
    config.tweet_consumer_key = "92JghxfQrZwXHHZXBIkalR9jf"
    config.tweet_consumer_secret = "fbjNCNmKv6ETAkMQG4BXkcr1i5JnQcUkuDgVYFauLliXqz889g"
    config.tweet_access_token = "4042896974-rRnfBMIpOaJvEyJfVA7ZSpP4l1btiFGL21VY3S1"
    config.tweet_access_token_secret = "WQnp7iGy1jAspglzzCkx5baFBBTCaU0poyZzq3lMkC6pS"
  end
end
