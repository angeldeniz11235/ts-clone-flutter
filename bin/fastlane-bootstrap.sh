#!/bin/bash
bundle install
cd android
bundle install
cd ../ios
bundle install

cd ../android
bundle exec fastlane android build_and_upload_to_appcenter

# cd ../ios
# bundle exec fastlane ios release_to_appcenter
