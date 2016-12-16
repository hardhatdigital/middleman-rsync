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

          if options[:build]
            puts "Building locally..."
            run("middleman build") || exit(1)
          end

          Middleman::Rsync.deploy(app, environment)
        end
     end

     Base.register(Middleman::Cli::Deploy, "deploy", "deploy [options]", "Deploy a middleman website via rsync")
  end
end
