require "middleman-core/cli"

module Middleman
  module Cli
     class Deploy < Thor::Group
        include Thor::Actions

        check_unknown_options!

        argument :environment, type: :string

        # Tell Thor to exit with a non-zero exit code on failure
        def self.exit_on_failure?
          true
        end

        def deploy
          unless environment == 'staging' || environment == 'production'
            raise Thor::Error, "Unknown environment '#{environment}'. Use 'staging' or 'production'."
          end

          Middleman::Rsync.deploy(environment)
        end
     end

     Base.register(Middleman::Cli::Deploy, "deploy", "deploy [options]", "Deploy a middleman website via rsync")
  end
end
