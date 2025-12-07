# Defer recache until after application initialization to ensure models are loaded
Rails.application.config.after_initialize do
  Cult.recache if defined?(Cult) && Cult.table_exists?
rescue => e
  Rails.logger.warn "Failed to recache cults: #{e.message}" if defined?(Rails.logger)
end