require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "df8816a6edf6c8b571f2239c23c8b5fc8868ed3fc6050b115080ccc6a2de9c98"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
