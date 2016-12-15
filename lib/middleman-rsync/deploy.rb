module Middleman
  module Rsync
    module_function

    def deploy(app, environment)
      config = app.extensions[:deploy].options
      server = config["#{environment}_server".to_sym]

      # Build
      # Rsync
      # Report
    end
  end
end
