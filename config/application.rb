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

    # Add ActionDispatch::Static middleware for compatibility
    config.middleware.use ActionDispatch::Static, Rails.root.join('public').to_s

    # Exclude ckeditor samples from assets precompile to avoid errors
    config.assets.precompile -= %w(ckeditor/samples/**/*)

  end
end
