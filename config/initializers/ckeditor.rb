# Use this hook to configure ckeditor
Ckeditor.setup do |config|
  # ORM
  require 'ckeditor/orm/active_record'

  # Languages to include
  config.assets_languages = %w[es en]

  # Enable Rails asset pipeline (ESTE SÍ EXISTE)
  config.assets_pipeline_enabled = true

  # JS config
  config.js_config_url = 'ckeditor/config.js?v44'
end
