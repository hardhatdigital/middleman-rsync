module Middleman
  module Rsync
    module_function

    def ask(*args)
      print(*args)
      STDIN.gets.strip
    end

    def deploy(app, environment)
      config = app.extensions[:deploy].options
      server = config["#{environment}_server".to_sym]

      puts "\nReady for deployment to #{environment}: #{server}\n\n"

      if not ["yes", "y"].include?(ask("OK? [Yes|y|Y|No|n|N] > ").downcase)
        puts "\nExiting."
        exit(1)
      else
        puts
      end

      puts "Running rsync..."
      # Rsync
      
      puts "Complete."
    end
  end
end
