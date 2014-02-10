load "deploy/assets"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

# Application name
set :application, "recruit"

# Repository
set :repository,  "https://github.com/Takien-inc/recruit.git"
set :scm, :git

# RVM
require 'rvm/capistrano'
set :rvm_ruby_string, '2.1.0'
set :rvm_type, :system
set :rvm_path, "/usr/local/rvm"

# Deploy user
set :user, 'deploy'
set :use_sudo, false
set :default_run_options, :pty => true

# Set tag, branch or revision
set :current_rev, `git show --format='%H' -s`.chomp
set :branch do
  default_tag = current_rev
  tag = ENV["DEPLOY_TARGET"] || Capistrano::CLI.ui.ask("Tag to deploy ->: [#{default_tag}]")
  tag = default_tag if tag.empty?
  tag
end

# for Unicorn
namespace :deploy do
  task :restart, :roles => :web, :except => { :no_release => true } do
    if File.exist? "#{pid_file}"
      run "kill -USR2 `cat #{pid_file}`"
    end
  end
end

namespace :resque do
  task :restart do
    if File.exist? "#{shared_path}/pids/resque.pid"
      run "kill `cat #{shared_path}/pids/resque.pid`"
    end
  end
end
after "deploy:restart", "resque:restart"

# clean up old releases
set :keep_releases, 2
after "resque:restart", "deploy:cleanup"

desc "symlinking after precompilation"
task :symlink, :roles => :app do
  run "ln -s #{release_path}/config/database.ymls/#{rails_env}.yml #{release_path}/config/database.yml"
  run "ln -s /mnt/nfs/caches #{release_path}/public/caches"
end
before "deploy:assets:precompile", :symlink