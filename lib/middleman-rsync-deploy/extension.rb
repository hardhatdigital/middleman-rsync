require "middleman-core"

class RsyncDeploy < ::Middleman::Extension
  option :server, nil, "Name of deployment server"
  option :path, nil, "Path on server to sync files"
  option :user, nil, "Remote user"

  def initialize(app, options_hash={}, &block)
    super
  end
end
