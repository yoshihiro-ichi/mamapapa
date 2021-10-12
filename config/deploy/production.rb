server '35.72.191.71', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/id_rsa'
