exit(0) if ENV["USE_SYSTEM_GECODE"]

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

      # Optimize for size on Windows
      ENV['CFLAGS'] = '-Os'
      ENV['CXXFLAGS'] = '-Os'
    # Older versions of CentOS and RHEL need to use this
    elsif File.exist?('/usr/bin/gcc44')
      ENV['CC'] = 'gcc44'
      ENV['CXX'] = 'g++44'
    end

    # Configure the gecode libraries to look for other gecode libraries in the
    # installed lib dir. This isn't needed for dep-selector to correctly link
    # the libraries it uses, but if you check the libraries with `ldd`, they
    # will appear to have missing deps or to link to system installed gecode.
    # When used inside an Omnibus project, this will make the health checker
    # report an error.
    libpath = File.join(PREFIX, "lib")
    ENV['LD_RUN_PATH'] = libpath
  end

  # Depending on the version of mingw we're using, g++ may or may not fail when
  # given the -pthreads option. When testing with `gcc version 4.6.2 (GCC)`
  # mingw, this patch is required for the build to succeed.
  def self.patch_configure
    if windows?
      original_configure = IO.read(configure)
      original_configure.gsub!('pthread', 'mthread')
      File.open(configure, "w+") { |f| f.print(original_configure) }
    end
  end

  def self.system(*args)
    print("-> #{args.join(' ')}\n")
    super(*args)
  end

  def self.run_build_commands
    setup_env
    patch_configure
    system(*configure_cmd) &&
      system("make", "clean") &&
      system("make", "-j", "5") &&
      system("make", "install") &&
      system("make", "distclean")
  end

  def self.run
    Dir.chdir(gecode_vendor_dir) do
      run_build_commands or raise BuildError, "Failed to build gecode library."
    end
  end

end

GecodeBuild.run
