#!/bin/bash
bundle install
cd ios
bundle install

# cd ../ios
bundle exec fastlane ios release_to_appcenter
