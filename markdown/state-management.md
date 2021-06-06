# Getting started with state management in Flutter (Part 1)
  Introduction
  When do we need to use state in flutter

## Shift your design thinking to be declarative
  A huge paradigm shift when working in Flutter is thinking declaratively. The way most of our brains work its much easy to understand imperative programming concept. When our code is organized as sequential steps it is easy to follow the code for one branch of code to the next. When programming declaratively we describe what need to be done and our system responds based on the action happening.

  What does this mean for Flutter. In Flutter we describe what should be done in our app and Flutter responds by drawing our application on a screen based on the current state of our application.

### Don't be afraid to re-draw
  Now that we are thinking declaratively. What happens when we need to change the state of our application? Showing a loading spinner? letting a user know they missed a required field?

  Flutter is designed to reactive to state changes. Any time Flutter detects that your state has been changed you application will redraw itself based on the current state of your application. 

  Flutter is reall fast so dont worry that you app needs to redraw itself. I have not seen any lag in the UI for the Flutter apps that I have built so far. And there are many ways that we can optimize which widgets and elements are redrawing and when.

## A look at Flutter Ephemeral State

### What is Ephemeral State
  As a self-taught developer Ephemeral is a word that I had to look up because it specifically had not come up in my learning up to this point in my career. The definition is Ephemeral is *lasting for a very short time.* So in context of speaking about your app your ephemeral state will be the state of your app that you do not expect to manage for the life of your app. Instead this is state that lives for short periods of time.

### Lets look at an example

  For example, imagine that you have a form the needs to be submitted.
  
  You have a few form fields with a button. When we click on the button we expect for that button to be disabled while we are submitting the form. 
  
  In order to manage the state of the button we decide to define a boolean value defined as `isLoading`. When `isLoading` is `false` we enable the submit button and a `Text` widget is show with "Login", when `true` the text of the button will be hidden and a `CircularProgressIndicator` will be shown inside of the button.

  In order to make the button not clickable we have to return `null` from the `onTapped` event on the button we will also switch on the state of our `isLoading` variable that we have been tracking.

## But what about when I need to keep track of some global state? Enter App State 
  App State comes a little more natural to me. One of the most concious decisions that you need to make in your application are related to how to manage state that lives only during a single session or over multiple sessions.

  Earlier we looked at our form submission *ephemeral* use case where we were managing the state of the button itself. Now lets expand on that and understand when we may use *app state* for our form.

  Now for our form we will be using our username and password field to simulate a login process. Once the user is authenticated we will return an access token that will be used during our "session to verify that our user has access data within our app.

  We need to store our token in *app state* vs *ephemeral state* so that we have access to our access token across many widgets in our application.

  We will build a class (`AppBloc`) that inherits from `InheritedWidget` manages our token for during our "session".

  `InheritedWidget`
    What is it
    How does is work

  Each time we make a call to get data for our app we will pass the `accessToken` that we retrieved from our state and send it to our data access layer where the user is validated before returning data.

## Options for State Management

  We have now learned the difference between different types of state for your Flutter applications and when to use them.

  We saw some examples of constructs that help us manage state. `StatelessWidget`, `InheritedWidget`, and `Bloc`. Over the next several posts we will cover these topics in mor depth. We are just touching the tip of the iceberg of state management concepts.

  Here is a subset of popular ways that Flutter state is managed:
  - setState
  - InheritedWidget
  - The Bloc pattern
  - Provider
  - Redux
  - ...

  In conclusion state is one of those things that are at the core of any application we build. It doesnt matter what method of state management that you use. What really matters is that you understand the decision behind when to use the types of state within you app. It will help you app become more maintainable as your state management design build consistency.