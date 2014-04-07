require "dep-selector-libgecode/version"

module DepSelectorLibgecode

  VENDORED_GECODE_DIR = File.expand_path("../dep-selector-libgecode/vendored-gecode", __FILE__)

  def self.opt_path
    File.join(VENDORED_GECODE_DIR, "lib")
  end

  def self.include_path
    File.join(VENDORED_GECODE_DIR, "include")
  end
end

