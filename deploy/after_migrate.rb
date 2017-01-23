rails_env = new_resource.environment["RAILS_ENV"]
Chef::Log.info("Start sidekiq")
execute "start sidequk" do
  cwd release_path
  command "bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production"
  environment "RAILS_ENV" => rails_env
end
