exit(0) if ENV["USE_SYSTEM_GECODE"]

require 'pp'
require 'rbconfig'

module GecodeBuild
  class BuildError < StandardError; end

  GECODE_VENDOR_DIR = File.expand_path("../vendor/gecode-3.7.3", __FILE__).freeze

  PREFIX = File.expand_path("../../../lib/dep-selector-libgecode/vendored-gecode", __FILE__).freeze

  def self.windows?
    !!(RUBY_PLATFORM =~ /mswin|mingw|windows/)
  end

  def self.darwin?
    RbConfig::CONFIG["host_os"] =~ /darwin/
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

    puts "+++++++++++I am in dep-selector-libgecode+++++++++++++"
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
      ENV['CC'] ||= 'gcc'
      ENV['CXX'] ||= 'g++'
      ENV['PROG_TAR'] ||= 'bsdtar'
      ENV['CFLAGS'] = "#{ENV['CFLAGS']} -Os"
      ENV['CXXFLAGS'] = "#{ENV['CXXFLAGS']} -Os"

    elsif File.exist?('/usr/bin/gcc44')
      ENV['CC'] = 'gcc44'
      ENV['CXX'] = 'g++44'

    elsif darwin?
      # macOS-specific flags
      ENV['CXXFLAGS'] = "-std=c++11 -Wno-deprecated-copy -Wno-new-returns-null -arch arm64"
      ENV['LDFLAGS']  = "-arch arm64"
    end

    libpath = File.join(PREFIX, "lib")
    ENV['LD_RUN_PATH'] = libpath
  end

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

  def self.num_processors
    n = case RbConfig::CONFIG['host_os']
        when /darwin/
          ((`which hwprefs` != '') ? `hwprefs thread_count` : `sysctl -n hw.ncpu`).chomp
        when /linux/
          `cat /proc/cpuinfo | grep processor | wc -l`.chomp
        when /freebsd/
          `sysctl -n hw.ncpu`.chomp
        when /mswin|mingw/
          require 'win32ole'
          wmi = WIN32OLE.connect("winmgmts://")
          cpu = wmi.ExecQuery("select NumberOfCores from Win32_Processor")
          cpu.to_enum.first.NumberOfCores
        else
          4
        end
    n = n.to_i
    return 1 if n < 1
    return 4 if n > 4
    n
  end

  def self.run_build_commands
    setup_env
    patch_configure
    case RbConfig::CONFIG['host_os']
    when /mswin|mingw/
      system(*configure_cmd) &&
        system("make", "clean") &&
        system("make", "-j", (num_processors + 1).to_s) &&
        system("make", "install") &&
        system("make", "distclean")
    else
      system("libtoolize --force") &&
        system("aclocal") &&
        system("autoheader") &&
        system("automake --force-missing --add-missing || true") &&
        system("autoconf") &&
        system("autoupdate gecode.m4") &&
        system(*configure_cmd) &&
        system("make", "clean") &&
        system("make", "-j", (num_processors + 1).to_s) &&
        system("make", "install") &&
        system("make", "distclean")
    end
  end

  def self.run
    Dir.chdir(gecode_vendor_dir) do
      run_build_commands or raise BuildError, "Failed to build gecode library."
    end
  end
end

GecodeBuild.run
