require "middleman-core"
require "middleman-rsync-deploy/commands"

Middleman::Extensions.register :deploy do
  require "rsync-deploy/extension"
  RsyncDeploy
end
