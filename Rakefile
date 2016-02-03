require 'rubygems'
require 'rake'

require 'rubygems/package_task'

gemspec = eval(File.read('dep-selector-libgecode.gemspec'))

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

task :compile do
  cd "ext/libgecode3"
  ruby "extconf.rb"
end

task :clean do
  sh "git clean -fdx"
end

require "github_changelog_generator/task"

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.future_release = DepSelectorLibgecode::VERSION
  config.enhancement_labels = "enhancement,Enhancement,New Feature".split(",")
  config.bug_labels = "bug,Bug,Improvement,Upstream Bug".split(",")
  config.exclude_labels = "duplicate,question,invalid,wontfix,no_changelog,Exclude From Changelog,Question".split(",")
end
