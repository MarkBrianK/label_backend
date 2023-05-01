require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Server
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_your_app_session'
    config.session_store :active_record_store, key: '_your_app_session', cookie: { key: '_your_app_user_id' }


    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3001'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end

    # CSRF protection settings
    config.action_controller.forgery_protection_origin_check = false
    config.action_controller.default_protect_from_forgery = {
      with: :exception,
      prepend: true,
      same_site: :strict,
      same_site: :lax,
      same_site: :none
    }



    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
