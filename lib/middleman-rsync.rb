require "middleman-core"
require "middleman-rsync/commands"
require "middleman-rsync/extension"

Middleman::Extensions.register :rsync do
  Middleman::Rsync::Extension
end
