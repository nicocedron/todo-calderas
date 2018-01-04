require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoCalderas
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework nil #Disable test generator
    end

    config.i18n.default_locale = :es
    config.time_zone = 'Buenos Aires'

  end
end
