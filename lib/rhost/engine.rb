module Rhost
  class Engine < Rails::Engine

    isolate_namespace Rhost

    initializer 'rhost.initialize' do |app|

      #
      # Add migrations from Rhost to the application
      #
      config.paths["db/migrate"].expanded.each do |expanded_path|
        app.config.paths["db/migrate"] << expanded_path
      end

      #
      # Load view helpers for the base application
      #
      ActiveSupport.on_load(:action_view) do
        require 'rhost/view_helpers'
        ActionView::Base.send :include, Rhost::ViewHelpers
      end
    end

    def self.mounted_path
      if route = Rails.application.routes.routes.select { |r| r.app == self or r.app.try(:app) == self }.first
        route.path.spec.to_s
      end
    end

  end
end
