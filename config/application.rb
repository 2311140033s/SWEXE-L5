require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module L5
  class Application < Rails::Application
    config.load_defaults 8.0
  end
end
