#!/bin/bash
bundle install
cd android
bundle install
cd ../ios
bundle install
cd ..
flutter build

flutter build apk
cd android
bundle exec fastlane deploy_appcenter
