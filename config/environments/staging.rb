Rails4::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true
  config.assets.js_compressor = Uglifier.new(output: {ascii_only: true})

  # Don't fallback to assets pipeline if a precompiled asset is missed
  #config.assets.compile = false
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  memcached_config = config.database_configuration[Rails.env]["memcached"]
  memcached_host = memcached_config["host"]
  memcached_port = memcached_config["port"]
  memcached_opts = memcached_config["options"]
  elasticache = Dalli::ElastiCache.new("#{memcached_host}:#{memcached_port}", memcached_opts)
  config.cache_store = :dalli_store, elasticache.servers, memcached_opts

  # config.cache_store = :dalli_store,
    # *config.database_configuration[Rails.env]["memcached"]["host"],
    # config.database_configuration[Rails.env]["memcached"]["options"]

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Mailer
  config.action_mailer.default_url_options = {host: Settings.host}
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.delivery_method = :ses
  config.action_mailer.raise_delivery_errors = true

  # config.staff_default_email_proc = ->shop_id, max_staff_id do
    # "kari-#{Digest::MD5.hexdigest("%s-%s" % [shop_id, max_staff_id])}@pmax.mobi"
  # end

end