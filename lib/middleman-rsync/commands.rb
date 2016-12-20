require "middleman-core/cli"

module Middleman
  module Cli
     class Deploy < Thor::Group
        include Thor::Actions

        check_unknown_options!

        argument :environment, type: :string

        class_option "build",
                     type: :boolean,
                     aliases: "-B",
                     default: true,
                     desc: "Build locally before deployment (default true)"

        # Tell Thor to exit with a non-zero exit code on failure
        def self.exit_on_failure?
          true
        end

        def deploy
          unless environment == "staging" || environment == "production"
            raise Thor::Error, "Unknown environment '#{environment}'. Use 'staging' or 'production'."
          end

          app = ::Middleman::Application.new
          config = app.extensions[:rsync].options
          server = config["#{environment}_server".to_sym]

          if options[:build]
            puts "Building locally..."
            run("middleman build") || exit(1)
          end

          puts "\nReady for deployment to #{environment}: #{server}\n\n"

          if not ["yes", "y"].include?(ask("OK? [Yes|y|Y|No|n|N] > ").downcase)
            puts "\nExiting."
            exit(1)
          else
            puts
          end

          puts "Running rsync..."
          run("rsync #{config[:rsync_flags]} ./build/ #{config[:user]}@#{server}:#{config[:path]}")

          puts "Complete."
        end
     end

     Base.register(Middleman::Cli::Deploy, "deploy", "deploy [environment] [options]", "Deploy a middleman website via rsync")
  end
end
