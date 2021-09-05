fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
### create_app
```
fastlane create_app
```
Create on Developer Portal and App Store Connect

----

## iOS
### ios signing
```
fastlane ios signing
```
sync signing
### ios build
```
fastlane ios build
```
build ios app
### ios release
```
fastlane ios release
```
release to test flight
### ios release_to_appcenter
```
fastlane ios release_to_appcenter
```
build and upload iOS binaries to app center
### ios upload_to_appcenter
```
fastlane ios upload_to_appcenter
```
upload iOS to app center

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
