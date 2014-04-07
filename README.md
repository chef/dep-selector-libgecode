# DepSelectorLibgecode

This library vendors Gecode 3.7.3 as a rubygem so it can easily be used
with the [dep-selector](https://github.com/opscode/dep-selector)
project.

[Gecode](http://www.gecode.org) is a fast CSP solver library written in
C++. We created this library to install it in order to optimize the
following criteria:
* Allow users to install libraries that depend on gecode without extra
steps.
* Install the correct version of gecode for dep-selector. The current
release line of gecode is 4.x, but dep-selector uses ~> 3.5.
* Configure the source installation for shortest compilation time by
excluding unnecessary components. Gecode has a reputation for taking a
long time to compile, but in fact most of that time is spent building
examples and documentation. We've disabled these, along with the
flatzinc interpreter.

## Installation

Add this line to your application's Gemfile:

    gem 'dep-selector-libgecode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dep-selector-libgecode

## Usage

`DepSelectorLibgecode` provides helper functions for locating the
vendored gecode after installation:

```ruby
require 'dep-selector-libgecode'

# The vendored lib dir:
DepSelectorLibgecode.opt_path

# The include dir (where the headers are):
DepSelectorLibgecode.include_path
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
