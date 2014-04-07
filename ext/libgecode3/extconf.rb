require 'pp'

module GecodeBuild
  class BuildError < StandardError; end

  GECODE_VENDOR_DIR = File.expand_path("../vendor/gecode-3.7.3", __FILE__).freeze

  PREFIX = File.expand_path("../../../lib/dep-selector-libgecode/vendored-gecode", __FILE__).freeze

  LOG_FILE_PATH = File.expand_path("../gecode_build.log", __FILE__)

  def self.gecode_vendor_dir
    GECODE_VENDOR_DIR
  end

  def self.prefix
    PREFIX
  end

  def self.configure_cmd
    %W[
      ./configure
      --prefix=#{prefix}
      --disable-doc-dot
      --disable-doc-search
      --disable-doc-tagfile
      --disable-doc-chm
      --disable-doc-docset
      --disable-qt
      --disable-examples
      --disable-flatzinc
    ]
  end

  def self.system(*args)
    print("-> #{args.join(' ')}\n")
    super(*args, [:out, :err] => [LOG_FILE_PATH, "w"])
  end

  def self.run_build_commands
    system(*configure_cmd) &&
      system("make", "clean") &&
      system("make", "-j", "5") &&
      system("make", "install")
  end

  def self.run
    Dir.chdir(gecode_vendor_dir) do
      run_build_commands or raise BuildError, "Failed to build gecode library. See log for details: #{LOG_FILE_PATH}"
    end
  end

end

GecodeBuild.run

