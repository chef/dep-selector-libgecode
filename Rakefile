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
