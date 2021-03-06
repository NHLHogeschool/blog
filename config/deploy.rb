require 'bundler/capistrano'
load 'deploy/assets'

set :application, "blog"
set :ip_address, "149.210.128.230"

set :deploy_to, "/home/deploy/#{application}"
set :user, 'deploy'
set :use_sudo, false

set :scm, :git
set :repository, "git@github.com:NHLHogeschool/blog.git"
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

default_run_options[:pty] = true

role :web, ip_address
role :app, ip_address
role :db,  ip_address, :primary => true