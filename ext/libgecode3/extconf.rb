require 'pp'

module GecodeBuild
  class BuildError < StandardError; end

  GECODE_VENDOR_DIR = File.expand_path("../vendor/gecode-3.7.3", __FILE__).freeze

  PREFIX = File.expand_path("../../../lib/dep-selector-libgecode/vendored-gecode", __FILE__).freeze

  def self.windows?
   !!(RUBY_PLATFORM =~ /mswin|mingw|windows/)
  end

  def self.gecode_vendor_dir
    GECODE_VENDOR_DIR
  end

  def self.configure
    File.join(GECODE_VENDOR_DIR, "configure")
  end

  def self.prefix
    PREFIX
  end

  def self.configure_cmd
    args = %W[
      sh
      #{configure}
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
    args << "--with-host-os=windows" if windows?
    args
  end

  def self.setup_env
    if windows?
      ENV['CC'] = 'gcc'
      ENV['CXX'] = 'g++'
    end
  end

  def self.system(*args)
    print("-> #{args.join(' ')}\n")
    super(*args)
  end

  def self.run_build_commands
    setup_env
    system(*configure_cmd) &&
      system("make", "clean") &&
      system("make", "-j", "5") &&
      system("make", "install")
  end

  def self.run
    Dir.chdir(gecode_vendor_dir) do
      run_build_commands or raise BuildError, "Failed to build gecode library."
    end
  end

end

GecodeBuild.run

