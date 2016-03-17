# Change Log

## [1.2.0](https://github.com/chef/dep-selector-libgecode/tree/1.2.0) (2016-03-17)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/v1.1.0...1.2.0)

**Merged pull requests:**

- Compile on Windows with passed-in flags [\#49](https://github.com/chef/dep-selector-libgecode/pull/49) ([jkeiser](https://github.com/jkeiser))

## [v1.1.0](https://github.com/chef/dep-selector-libgecode/tree/v1.1.0) (2016-02-04)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/v1.1.0.beta.1...v1.1.0)

## [v1.1.0.beta.1](https://github.com/chef/dep-selector-libgecode/tree/v1.1.0.beta.1) (2016-02-04)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.2...v1.1.0.beta.1)

**Fixed bugs:**

- dep\_selector.bundle architecture problem on x64 Mac OS X 10.9 [\#30](https://github.com/chef/dep-selector-libgecode/issues/30)

**Closed issues:**

- ./configure fails because of bashisms [\#46](https://github.com/chef/dep-selector-libgecode/issues/46)
- unable to do bundle install in CentOS \(Failed to build gecode library. \(GecodeBuild::BuildError\)\) [\#44](https://github.com/chef/dep-selector-libgecode/issues/44)
- can't install on Debian testing [\#37](https://github.com/chef/dep-selector-libgecode/issues/37)
- install trouble on debian testing/unstable [\#35](https://github.com/chef/dep-selector-libgecode/issues/35)
- dep-selector-libgecode will not install during bundle install with Ubuntu 13.10 [\#31](https://github.com/chef/dep-selector-libgecode/issues/31)
- Failed to build gecode library - Windows 8.1 [\#25](https://github.com/chef/dep-selector-libgecode/issues/25)

**Merged pull requests:**

- Bump version to 1.1, add github\_changelog\_generator [\#48](https://github.com/chef/dep-selector-libgecode/pull/48) ([jkeiser](https://github.com/jkeiser))
- Update installation instructions for windows. [\#40](https://github.com/chef/dep-selector-libgecode/pull/40) ([cmluciano](https://github.com/cmluciano))
- Configure Window’s environments to use `bsdtar` [\#33](https://github.com/chef/dep-selector-libgecode/pull/33) ([schisamo](https://github.com/schisamo))

## [1.0.2](https://github.com/chef/dep-selector-libgecode/tree/1.0.2) (2014-06-19)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.1...1.0.2)

**Closed issues:**

- 1gb of RAM causes gem install to fail [\#24](https://github.com/chef/dep-selector-libgecode/issues/24)
- Failed to build gem native extension: 'forceinline' does not name a type [\#22](https://github.com/chef/dep-selector-libgecode/issues/22)

**Merged pull requests:**

- Enable size optimizer for windows. [\#26](https://github.com/chef/dep-selector-libgecode/pull/26) ([sersut](https://github.com/sersut))

## [1.0.1](https://github.com/chef/dep-selector-libgecode/tree/1.0.1) (2014-05-22)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.0...1.0.1)

**Closed issues:**

- Errors installing dep-selector-libgecode 1.0.0 gem [\#16](https://github.com/chef/dep-selector-libgecode/issues/16)
- "gem install berkshelf" fails with Ruby 2.1.1 - "Failed to build gecode library" [\#15](https://github.com/chef/dep-selector-libgecode/issues/15)
- Windows Install Dependency on Tar [\#13](https://github.com/chef/dep-selector-libgecode/issues/13)
- Installing fails because of oom-killer [\#11](https://github.com/chef/dep-selector-libgecode/issues/11)
- OSX: With homebrew GeCode 4.x installed, gem doesn't work [\#10](https://github.com/chef/dep-selector-libgecode/issues/10)

**Merged pull requests:**

- use gcc44 on older rhel systems [\#21](https://github.com/chef/dep-selector-libgecode/pull/21) ([smith](https://github.com/smith))
- Cleanup after gecode compile [\#17](https://github.com/chef/dep-selector-libgecode/pull/17) ([nhuff](https://github.com/nhuff))
- System gecode readme [\#14](https://github.com/chef/dep-selector-libgecode/pull/14) ([danielsdeleo](https://github.com/danielsdeleo))

## [1.0.0](https://github.com/chef/dep-selector-libgecode/tree/1.0.0) (2014-04-14)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.0.rc.1...1.0.0)

**Closed issues:**

- Takes a long time to install and offers no feedback [\#9](https://github.com/chef/dep-selector-libgecode/issues/9)
- Windows Issue - dep-selector [\#8](https://github.com/chef/dep-selector-libgecode/issues/8)
- Failed to install dep-selector-libgecode 1.0.0.rc0 on Windows [\#6](https://github.com/chef/dep-selector-libgecode/issues/6)

## [1.0.0.rc.1](https://github.com/chef/dep-selector-libgecode/tree/1.0.0.rc.1) (2014-04-10)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.0.rc.0...1.0.0.rc.1)

**Merged pull requests:**

- Patch `configure` on windows to use mthread instead of pthread [\#7](https://github.com/chef/dep-selector-libgecode/pull/7) ([danielsdeleo](https://github.com/danielsdeleo))
- Set LD\_RUN\_PATH to fix omnibus builds that use this gem [\#5](https://github.com/chef/dep-selector-libgecode/pull/5) ([danielsdeleo](https://github.com/danielsdeleo))
- Update CONTRIBUTING now that we've decided on licensing [\#4](https://github.com/chef/dep-selector-libgecode/pull/4) ([danielsdeleo](https://github.com/danielsdeleo))

## [1.0.0.rc.0](https://github.com/chef/dep-selector-libgecode/tree/1.0.0.rc.0) (2014-04-08)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.0.alpha.2...1.0.0.rc.0)

## [1.0.0.alpha.2](https://github.com/chef/dep-selector-libgecode/tree/1.0.0.alpha.2) (2014-04-07)
[Full Changelog](https://github.com/chef/dep-selector-libgecode/compare/1.0.0.alpha.1...1.0.0.alpha.2)

**Merged pull requests:**

- Windows fixes [\#3](https://github.com/chef/dep-selector-libgecode/pull/3) ([danielsdeleo](https://github.com/danielsdeleo))
- skip processing extconf if USE\_SYSTEM\_GECODE env var is set [\#2](https://github.com/chef/dep-selector-libgecode/pull/2) ([reset](https://github.com/reset))

## [1.0.0.alpha.1](https://github.com/chef/dep-selector-libgecode/tree/1.0.0.alpha.1) (2014-04-07)
**Merged pull requests:**

- License packaging code as Apache2 for now [\#1](https://github.com/chef/dep-selector-libgecode/pull/1) ([danielsdeleo](https://github.com/danielsdeleo))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*