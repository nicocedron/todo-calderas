Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled.
  config.consider_all_requests_local = true

  # Enable caching.
  config.action_controller.perform_caching = true

  # Serve static files if ENV var is present (Heroku)
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates.
  config.assets.digest = true

  # Force all access to the app over SSL.
  # ⚠️ DESACTIVADO para evitar errores en Heroku
  # config.force_ssl = true

  # Use lowest log level to ensure availability of diagnostic information
  config.log_level = :debug

  # Log tags
  config.log_tags = [:request_id]

  # 🔥 LOGS A STDOUT (HEROKU)
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Use default locale fallbacks
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify
end
