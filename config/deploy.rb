lock '3.8.0'

set :application, 'atlas'
set :repo_url, 'https://github.com/tmaesaka/atlas.git'

set :deploy_to, '/srv/www/atlas'

append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
