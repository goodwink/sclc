require 'hoptoad_notifier/capistrano'

set :application, "sclc"
set :repository,  "git@github.com:goodwink/#{application}.git"
set :scm_user, "git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www/#{application}"
set :use_sudo, false

server "67.23.79.163", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
  run "touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end