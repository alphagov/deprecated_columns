require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "gem_publisher"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :publish_gem do |t|
  gem = GemPublisher.publish_if_updated("deprecated_columns.gemspec", :rubygems)
  puts "Published #{gem}" if gem
end
