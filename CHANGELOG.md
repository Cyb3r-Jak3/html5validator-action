<!-- markdownlint-disable MD024 -->
# Changelog

## [v0.7.0] - 2021-11-03

### Adds

* Adds a check to make sure there is git repo checked out

### Changes

* Removes action_debug input in favor `HTML5_ACTION_DEBUG` environment variable.

### Removes

* Removes docker build action as the actions check builds the container

## [v0.6.1] - 2021-06-16

* Corrected README for previous changes

## [v0.6] - 2021-05-07

* Map action input names to html5validator inputs

## [v0.5] - 2021-03-27

* Adds ignore option to ignore files and directories

## [v0.4.4] - 2020-12-05

### Changed

* Swapped to using the image from GitHub's Container registry

## [v0.4.3] - 2020-10-10

### Add

* Ability to use config files. Fixed #10

### Changed

* Made it so the default image is alpine based so smaller.

## [v0.4.2] - 2020-08-08

### Changed

* Made it so that the exit code will be set on failure. See [#8](https://github.com/Cyb3r-Jak3/html5validator-action/pull/8)

## [v0.4.1] - 2020-07-05

### Added

* Issue Templates

### Changed

* Swapped to using tee for better log output.

## [v0.4] - 2020-02-19

### Added

* Logging feature
* Weekly action to build

## [v0.3] - 2019-12-30

### Added

* A lot more action inputs to make it easier to use.
  * CSS option.
  * Log Level.
  * Log Format.
* New action that tests integration with Github Actions.

### Changed

* Removed hyperlinks from README

### Removed

* Build arguments for the docker image.
* Invalid tests.

## [v0.2] - 2019-12-29

### Added

* extra for additional arguments for html5validator.
* Changelog

### Changed

* Changed result to exit code rather than output because, by default, html5validtor generates no output for success.

## [v0.1] - 2019-12-12

### First working version

*only supports root path.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
