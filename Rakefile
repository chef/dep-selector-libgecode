require 'rubygems'
require 'rake'

require 'rubygems/package_task'

gemspec = eval(File.read('dep-selector-libgecode.gemspec'))

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

task :native => ['compile'] do
  cp_r "pkg/dep-selector-libgecode-#{gemspec.version}/lib/dep-selector-libgecode/vendored-gecode", "lib/dep-selector-libgecode/"
  gemspec.files += Dir['lib/dep-selector-libgecode/vendored-gecode/**/*']
  gemspec.platform = Gem::Platform.new(RUBY_PLATFORM)
  gemspec.extensions = []
  gem = nil
  if Gem::VERSION > '2.0'
    gem = Gem::Package.build(gemspec)
  else
    gem = Gem::Builder.new(gemspec).build
  end
  mv gem, "pkg/dep-selector-libgecode-#{gemspec.version}-#{gemspec.platform.to_s}.gem"
end
