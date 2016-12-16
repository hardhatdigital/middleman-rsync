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

      puts "Deploying to #{environment}: #{server}\n"

      if not ["yes", "y"].include?(ask("OK? [Yes|y|Y|No|n|N] > ").downcase)
        puts "Exiting."
        exit(1)
      end

      puts "Building locally..."
      run("middleman build") || exit(1)

      puts "Running rsync..."
      # Rsync
      
      puts "Complete."
    end
  end
end
