set :rails_env, "staging"
set :deploy_env, "staging"
# Directories
set :deploy_to, "/usr/local/rails_apps/recruit"
set :pid_file, "/tmp/unicorn_recruit.pid"

role :web, "localhost"
role :app, "localhost"
role :db, "localhost", primary: true