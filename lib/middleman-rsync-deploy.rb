require "middleman-core"

Middleman::Extensions.register :middleman-rsync-deploy do
  require "rsync-deploy/extension"
  RsyncDeploy
end
