#!/bin/bash
bundle install
cd android
bundle install
bundle exec fastlane android build_and_upload_to_appcenter