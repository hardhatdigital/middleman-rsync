require "middleman-core/cli"

module Middleman
  module Cli
     class Deploy < Thor::Group
        include Thor::Actions

        def deploy
          puts "TEST"
        end
     end

     Base.register(Middleman::Cli::Deploy, "deploy", "deploy [options]", "Deploy a middleman website via rsync")
  end
end
