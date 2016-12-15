module Middleman
  module Rsync
    module_function

    def deploy(app, environment)
      config = app.extensions[:deploy].options

      puts "DEPLOYING to #{config["#{environment}_server".to_sym]}"
    end
  end
end
