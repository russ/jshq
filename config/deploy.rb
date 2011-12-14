require "bundler/capistrano"

set :application, "jshq"
set :repository,  "git@github.com:russ/jshq.git"

set :scm, :git
set :git_shallow_clone, 1
set :user, "web"
set :deploy_to, "/home/web/apps/#{application}"

default_run_options[:pty] = true
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
ssh_options[:username] = "web"

role :web, "jshq.org"
role :app, "jshq.org"
role :db,  "jshq.org", :primary => true
role :db,  "jshq.org"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
