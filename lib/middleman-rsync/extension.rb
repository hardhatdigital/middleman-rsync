require "middleman-core"

class RsyncDeploy < ::Middleman::Extension
  option :production_server, nil, "Domain name of production server"
  option :staging_server, nil, "Domain name of staging server"
  option :path, nil, "Path on server to sync files"
  option :user, nil, "Remote user"
  option :rsync_flags, "--compress --archive --delete -v", "Flags to pass to Rsync"

  def initialize(app, options_hash={}, &block)
    super
  end
end
