<!-- markdownlint-disable MD024 -->
# Changelog

## [v0.4.1] - 2020-07-05

### Added

- Issue Templates

### Changed

- Swapped to using tee for better log output.

## [v0.4] - 2020-02-19

### Added

- Logging feature
- Weekly action to build

## [v0.3] - 2019-12-30

### Added

- A lot more action inputs to make it easier to use.
  - CSS option.
  - Log Level.
  - Log Format.
- New action that tests integration with Github Actions.

### Changed

- Removed hyperlinks from README

### Removed

- Build arguments for the docker image.
- Invalid tests.

## [v0.2] - 2019-12-29

### Added

- extra for additional arguments for html5validator.
- Changelog

### Changed

- Changed result to exit code rather than output because, by default, html5validtor generates no output for success.

## [v0.1] - 2019-12-12

### First working version

- only supports root path.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)