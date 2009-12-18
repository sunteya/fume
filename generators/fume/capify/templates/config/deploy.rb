set :stages, Dir[File.join(File.dirname(__FILE__), "deploy", "*.rb")].map {|f| File.basename(f, ".rb") }
require 'capistrano/ext/multistage'

set :application, "application"

set :scm, :subversion
set :default_repo_path, "trunk"
set :repository_root, "http://svn_repo_path"
set(:tag) { Capistrano::CLI.ui.ask("Type a tag to deploy [default use /#{default_repo_path}]: ") }
set(:repository) { (tag == "") ? "#{repository_root}/#{default_repo_path}" : "#{repository_root}/tags/#{tag}" }

namespace :deploy do
  desc <<-DESC
    Deploy and run pending migrations.
  DESC
  task :migrations do
    set :migrate_target, :latest
    update_code
    symlink
    migrate
    restart
  end
end

after "deploy:symlink", :roles => :app do
  run "if [ -e #{shared_path}/database.yml ]; then rm -f #{current_path}/config/database.yml; ln -s #{shared_path}/database.yml #{release_path}/config/database.yml; fi"
  run "if [ -e #{shared_path}/application.yml ]; then rm -f #{current_path}/config/application.yml; ln -s #{shared_path}/application.yml #{release_path}/config/application.yml; fi"
end

desc "Update the crontab file"
after "deploy:symlink", :roles => :db do
  run "if [ -e #{current_path}/config/schedule.rb ]; then cd #{current_path} && whenever --update-crontab #{application} --set environment=#{rails_env}; fi"
end
