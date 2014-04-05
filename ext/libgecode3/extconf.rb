require 'pp'

gecode_vendor_dir = File.expand_path("../vendor/gecode-3.7.3", __FILE__)
prefix = File.expand_path("../../../lib/dep-selector-libgecode3/vendor", __FILE__)

pp :prefix => prefix

configure_cmd = %W[
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

Dir.chdir(gecode_vendor_dir) do
  system(configure_cmd) &&
    system("make -j 5")
end

