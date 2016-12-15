# Require core library
require 'middleman-core'

# Extension namespace
class RsyncDeploy < ::Middleman::Extension
  option :server, nil, "Name of deployment server"
  option :path, nil, "Path on server to sync files"
  option :user, nil, "Remote user"

  def initialize(app, options_hash={}, &block)
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end

  # helpers do
  #   def a_helper
  #   end
  # end
end
