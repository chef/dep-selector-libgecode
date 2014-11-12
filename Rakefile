require 'rubygems'
require 'rake'

require 'rubygems/package_task'

gemspec = eval(File.read('dep-selector-libgecode.gemspec'))

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

task :compile do
  Dir.chdir "ext/libgecode3" do
    ruby "extconf.rb"
  end
end

task :clean do
  sh "git clean -fdx"
end

task :native => ['compile'] do
  gemspec.files += Dir['lib/dep-selector-libgecode/vendored-gecode/**/*']
  gemspec.platform = Gem::Platform.new(RUBY_PLATFORM)
  gem = Gem::Builder.new(gemspec).build
  mkdir_p 'pkg'
  mv gem, "pkg/dep-selector-libgecode-#{RUBY_PLATFORM}-#{gemspec.version}.gem"
end
