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

### Requirements

This gem runs make with concurrent jobs to speed build time, so it uses
about 2GB of RAM during the build. If this doesn't work for your
environment, see 'Using a System Gecode Instead' below. Better yet, if
you only want to install Berkshelf, try using
[ChefDK](http://www.getchef.com/downloads/chef-dk) instead of a gem
install.

### Using a System Gecode Instead

Use the "USE_SYSTEM_GECODE" environment variable when installing to
make dep-selector-libgecode use the system version, instead of
downloading the source and building its own copy:

    $ USE_SYSTEM_GECODE=1 gem install dep-selector-libgecode

*WARNING:* Ensure that your system packages provide Gecode version 3 and
not version 4. Version 4 does not work with dep-selector.

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

## Licensing

The packaging code here is released under the terms of the Apache2
license. Gecode itself is released under the terms of the MIT license.

See CONTRIBUTING.md for more information.

## Contributing

See CONTRIBUTING.md for more information.

