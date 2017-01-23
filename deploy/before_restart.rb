def self.list_environment
  result = {}
  node[:deploy].each do |_, deploy|
    deploy[:environment_variables].each do |key, value|
      result[key] = value
    end
  end
  result
end

Chef::Log.info("Start sidekiq")
execute "start sidequk" do
  cwd release_path
  command "bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production"
  environment(list_environment)
end
