# Deploy your Flutter app to AppCenter using Fastlane Part 1 (Android)

## Your created a Flutter app on your local machine but how do you share it with the world

One of the most satifying feelings is picking up a new technology and building features that work. But now we want to get our app into our user hands. We will eventually want to get our apps live on the app stores for Android and iOS. But first lets deploy our app to a place where our friends can test our app before we get a bunch of negative reviews on the app store. In part one we will set up Fastlane for Android, since Android setup has less steps.

## Using AppCenter as a testing tool

[AppCenter](https://appcenter.ms), Also known as the "Hockey App", is a tool that is designed for buidling, testing and deploying your mobile applications. In this post we will use AppCenter as the conduent for testing our applications before we deploy our app to the app store. AppCenter gives us the ability to create our own internal "test" app store so that we can share our app with other to test on their physical devices. Instead of using AppCenter to manage our build process we will use a tool called [Fastlane](https://fastlane.tools)

## Why Fastlane

Fastlane is the easist way that I have found to manage the build and release activities related to Android and iOS apps. Fastlane gives you built in actions that allow you to perform builds, manage certificates, screenshots, etc. in order to build out your ci/cd pipelines.

## Getting started with Fastlane

Install Ruby (version 2.5 or newer)

- If you are using a Mac, I recommend `rbenv`, click [here](https://github.com/rbenv/rbenv#installation) for installation instructions
- If you are using Windows, I recommend using [Chocolatey](https://community.chocolatey.org/packages/ruby) to download Ruby

Now that you have ruby install Bundler

`gem install bundler`

Then run `bundler update` to make sure you have the latest versions of yourr bundles

change directory into your android folder

`cd android`

then..

`fastlane init`

Your will now have a new directory in your android folder named `fastlane`. Inside you will find `fastlane/Fastfile` where you will find some boilerplate `lanes`

We will create a new lane to deploy our app to AppCenter, but first we need to install the [Fastlane plugin for AppCenter](https://github.com/microsoft/fastlane-plugin-appcenter)

`fastlane add_plugin appcenter`

The Fastlane appcenter plugin supports the following actions as of version `1.11.1`

```
appcenter_fetch_version_number, appcenter_fetch_devices, appcenter_upload
```

`fastlane action appcenter_upload`

This command will print out a list of the available parameter that the action supports. This command works with any built in or installed action.

### Create your upload keystore.jks for local code signing

In order to build a release version of your app you will need to generate a keystore. The keystore is used to sign your app using your upload key and later your app is signed by [Play App signing](https://developer.android.com/studio/publish/app-signing#app-signing-google-play).

The Flutter team has put together An instruction guide on flutter.dev for [creating and upload keystore](https://flutter.dev/docs/deployment/android#create-an-upload-keystore). One issue that I had while working on a mac (.zshrc) is the java keytool wasnt in the path. So I had to run flutter doctor in order to see where keytool was located.

There is a note in the documentation about how to handle this issue. Make sure to read the NOTE!

### Configure signing in gradle

When you set up your keystore you will set up a store password and key password. You will need this when you create your `key.properties` file. 

Create a file `./android/key.properties` with the following configuration

```
storePassword={storePassword}
keyPassword={keyPassword}
keyAlias=upload
storeFile={path_to_keystore.jks_file}
```

In your `android/app/build.gradle` file you will find a section

```
buildTypes {
    release {
        signingConfig signingConfigs.debug
    }
}
```
Replace that section with the following config.

```
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
```
## Build the Android Apk

Now that we have the configuration set up for our release version of our android app we will build a release version of our app.

The command to build an android apk is:

`flutter build apk`

This command will build our app and output the apk in our `./build` folder. If your build folder doesnt exist yet thats ok. Flutter will generate it for us when we build for the first time.

## Building out our lane to upload to AppCenter

The first thing that we we are going to have to do is setup our flutter build for Android. Once we have our android build set up we will deploy our apk to AppCenter.

We will use the [Fastlane plugin for Flutter](https://github.com/dotdoom/fastlane-plugin-flutter) 

`fastlane add_plugin flutter`

We will create our first lane that will describe how our `apk` is built.

```
desc "build android apk"
lane :build do
    flutter_build(
        build: "apk",
        build_number: {buildNumber}
    )
end
```

## Finally uploading our app to AppCenter

Once we build our apk successfully we now have an artifact tht we can upload to appcenter.

Earlier in the process we ran `bundle exec fastlane init` in our `android` directory. If we open up our fastfile (`./android/fastlane/Fastfile`)

We will be adding a lane called upload_to_appcenter.

```
desc "upload android apk to app center"
lane :upload_to_appcenter do
    appcenter_upload(
        # APPCENTER_API_TOKEN set in .env file, get this value from appcenter
        owner_name: "{{owner_name}}", # owner name to be shown in appcenter for the app
        owner_type: "user", # Default is user - set to organization for appcenter organizations
        app_name: "{{app_name}}", # app name  is the name of your app registered with android
        file: {{file}}, # path of the apk that was built for upload
        notify_testers: true # Set to false if you don't want to notify testers of your new release (default: `false`)
    )
end
  ```
Since our APPCENTER_API_TOKEN hold sensitive information we do not want to expose that information to all of the members of our team. I am using a package called `.dotenv` to manage environment variables for each environment. I will do a future blog post on `.dotenv` but go to [fastlane keys - best practices](https://docs.fastlane.tools/best-practices/keys/) for managing fastlane keys.

Now for the moment of truth

Run: 

`bundle exec fastlane android upload_to_appcenter`

Drum roll please..............

on successful upload you will see the following in your terminal

Then go over to AppCenter and check the portal to see your new Android build available for download.

## Gotchas...

The version that you see in appcenter after your first build is uploaded will be `1.0.0 (1)` by default. the first part of the version comes from the `version` property inside of your `pubspec.yaml` file. Anytime you want to update your version make sure that you update the version in your yaml file. 

The second value in the version displayed in appcenter is the `build-number`. The build number by default will always be `1` if we dont specify the `build-number`. So to customize this value you will need to pass build number to your build. 

For example:

`flutter build apk --build-number 1000000004`

## Was it worth it

Building and deploying apps can be a tedious and sometimes frustrating thing. Every framework has its own process to get the application deployed and keeping track of those differences. This is where fastlane shines. We can set up our build and release pipeline one time and reliably repeat that process time and time again.