require "bundler/gem_tasks"

require "rubygems/package_task"

gemspec = eval(File.read("dep-selector-libgecode.gemspec"))

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

task :compile => ['gem'] do
  Dir.chdir "pkg/dep-selector-libgecode-#{gemspec.version}/ext/libgecode3" do
    ruby "extconf.rb"
  end
end

task :clean do
  sh "git clean -fdx"
end

begin
  require "github_changelog_generator/task"

  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = DepSelectorLibgecode::VERSION
    config.enhancement_labels = "enhancement,Enhancement,New Feature".split(",")
    config.bug_labels = "bug,Bug,Improvement,Upstream Bug".split(",")
    config.exclude_labels = "duplicate,question,invalid,wontfix,no_changelog,Exclude From Changelog,Question".split(",")
  end
rescue LoadError
  # dont care
end

task :native => ['compile'] do
  cp_r "pkg/dep-selector-libgecode-#{gemspec.version}/lib/dep-selector-libgecode/vendored-gecode", "lib/dep-selector-libgecode/"
  gemspec.files += Dir['lib/dep-selector-libgecode/vendored-gecode/**/*']
  gemspec.platform = Gem::Platform.new(RUBY_PLATFORM)
  gemspec.extensions = []
  gem = Gem::Package.build(gemspec)
  mv gem, "pkg/dep-selector-libgecode-#{gemspec.version}-#{gemspec.platform.to_s}.gem"
end
