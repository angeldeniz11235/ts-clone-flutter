#!/bin/bash
bundle install
cd ios
bundle install
bundle exec fastlane ios upload_to_testflight
