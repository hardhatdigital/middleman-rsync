# middleman-rsync-deploy

Deploy middleman sites via rsync.

The site is built locally and then the `./build` directory is transported to the server via rsync.

## Installation

Add it to your Gemfile:
```
gem "middleman-rsync-deploy"
```

Bundle:
```
$ bundle install
```

Configure your environments in `config.rb`:
```
activate :deploy do |deploy|
  deploy.production_server  = "myapp.com"
  deploy.staging_server  = "staging.myapp.com"
  deploy.path  = "/path/to/middleman/app/on/servers"
  deploy.user  = "rsync_user"

  # Optional:
  deploy.rsync_flags, "--compress --archive --delete -v"
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
