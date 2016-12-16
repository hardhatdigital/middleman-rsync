require "middleman-core"
require "middleman-rsync/commands"

Middleman::Extensions.register :deploy do
  require "middleman-rsync/extension"

  RsyncDeploy
end
