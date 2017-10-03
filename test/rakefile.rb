require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features_headless) do |t|
  t.cucumber_opts = "HEADLESS=true"
end