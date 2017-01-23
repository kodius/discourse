rails_env = new_resource.environment["RAILS_ENV"]
Chef::Log.info("Precompiling assets for RAILS_ENV=#{rails_env}...")
execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => rails_env
end

Chef::Log.info("Stop sidekiq")
execute "stopping sidequk" do
  cwd release_path
  command "ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9"
  environment "RAILS_ENV" => rails_env
end
