# Getting started with state management in Flutter (Part 2)

## Introduction to the Provider package

In part 1 of the introduction to state management, we introduced Flutter's most basic constructs for state management. Using `setState()` and `InheritedWidget`'s gave us the ability to control how our application re-draws itself based on state changes in real time. In part 2, we will introduce the [Provider](https://pub.dev/packages/provider) package, adding another tool in our toolbox for managing state. Provider gives us an abstraction on top of the `InheritedWidget` and gives us an easy to use APi that help us to remove the amount of boiler plate code that we have to write which is always a win.

## Referencing the Provider package in your Flutter application

When building Flutter apps we make use of the Dart package management system [pub.dev](https://pub.dev). Pub is very similar to other package managers from other languages.

In order to install the `Provider` package into our project we will need to run the following command in the terminal at the root of our project.

`flutter pub add provider`

This will add a line in your pubspec.yaml that looks like this. 

If your IDE does not automatically install the package you may need to run `flutter pub get`.

## Converting our AppBloc from being an InheritedWidget to being a Provider

In part 1, we wrapped our Login page with an AppBloc. This give us access to walk up the widget tree to find our instance of the AppBloc that holds our state.

Using the `AppBloc.of` syntax we were able to access our instance to read an update our app state and react based on the current state of our app on redraw of the Login page.

In our new `AppBloc` you see that we are no longer inheriting from `Inheritedwidget`, it just looks like a plain old class object (POCO).

Our new `MaterialApp` has a home widget that uses the `Provider.value` constructor to create a provider using the AppBloc.

When we access our provider in our Login page we will now use a different syntax `Provider.of<T>(BuildContext context, {bool listen})`.

When we access our `AppBloc` using this syntax we will receive an instance our `Provider.value` that we created in our `MaterialApp`. This syntax should look familar to our InheritedWidget syntax but removes a bunch of boiler plate code that we would have had to write using the raw `InheritedWidget`

## Why use the Provider pattern

We just looked at a very simple example of using the Provider pattern. The provider pattern can be used to support a complex Flutter architecture that provider change notifiers that help you to redraw your widgets and replace `setState` and a bunch of other useful functionality. In a future post we will dig into more complex use cases of the provider pattern.

Leave me a comment or send me a tweet if you would like to see more from the Provider package to help build out your Flutter architecture to manage your apps state.

