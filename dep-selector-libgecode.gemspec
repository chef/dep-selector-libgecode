# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dep-selector-libgecode/version'

Gem::Specification.new do |spec|
  spec.name          = "dep-selector-libgecode"
  spec.version       = DepSelectorLibgecode::VERSION
  spec.authors       = ["Chef Software"]
  spec.email         = ["oss@chef.io"]
  spec.summary       = %q{Installs a vendored copy of Gecode suitable for use with dep-selector}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/chef/dep-selector-libgecode"
  spec.licenses       = ["MIT", "Apache-2.0"]

  spec.files         = %w{LICENSE} + Dir.glob("{lib,ext}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.require_paths = ["lib"]

  spec.extensions = Dir["ext/**/extconf.rb"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
