require "bundler/gem_tasks"

desc "Run bacon specs"
task :bacon do
  sh "bundle exec bacon spec/**/*_spec.rb"
end

desc 'Build and send it to Gemfury'
task :deploy do
  sh "rake build"
  sh "fury push pkg/simple_user_agent-#{SimpleUserAgent::VERSION}.gem "
end
