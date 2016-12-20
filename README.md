# middleman-rsync

Deploy middleman sites via rsync.

The site is built locally and then the `./build` directory is transported to the server via rsync.

## Installation

Add it to your Gemfile:
```
gem "middleman-rsync"
```

Bundle:
```
$ bundle install
```

Configure your environments in `config.rb`:
```
activate :rsync do |rsync|
  rsync.production_server  = "myapp.com"
  rsync.staging_server  = "staging.myapp.com"
  rsync.path  = "/path/to/middleman/app/on/servers"
  rsync.user  = "rsync_user"

  # Optional:
  rsync.rsync_flags, "--compress --archive --delete -v"
end
```

## Usage

Production:
```
$ middleman deploy production
```

Staging (optional):
```
$ middleman deploy staging
```
