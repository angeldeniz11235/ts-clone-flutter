# dev_jayhackett_blogdemo

A new Flutter project that teaches different aspects of flutter

## Getting Started

Make sure you install ruby if its not already installed

1. Build your android app
  `flutter build appbundle`
2. Build your iOS app
  `flutter build ios --release --no-codesign`
3. Navigate to the `android` folder to initialize fastlane for your android project
  `cd android`
  `fastlane init`
4. Navigate to the `ios` folder to initialize fastlane for your ios project
  `cd .. && cd ios`
  `fastlane init`

Now lets set up up our app identifier in our project. When creating your Flutter project your package name will be set up using the name of your project. Due to the naming conventions required by Flutter and Dart you will likely have to change this to match you bundle id that you created in the Google `Play Console` and `App Store Connect` respectively.

1. For Android find your `AndroidManifest.xml` file and update you package name to match your bundle identifier that you set up

2. For iOS find your `PRODUCT_BUNDLE_IDENTIFIER` in your Info.plist file and update it to match your bundle idnetifier that you have set up

## iOS Code Signing
