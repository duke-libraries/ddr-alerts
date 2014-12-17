begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

APP_ROOT = File.dirname(__FILE__)

require 'rspec/core/rake_task'

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec => ["app:db:migrate", "app:db:test:prepare"])

desc "Run the CI build"
task :ci do
  Rake::Task['spec'].invoke
end

task :default => :spec