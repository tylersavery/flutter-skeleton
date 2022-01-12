# flutter_skeleton

Flutter app skeleton using flutter_riverpod, dotenv, auto_route, get_it, freezed, and dio

## Overview

This skeleton has all the basic boilerplate for common challenges in software development. It is setup assuming there is a basic RESTful api associated with it, but that can be removed fairly easily if this doesn't require an API.

This is meant for full cross platform apps and has responsiveness at its core. All UI is separated from the business logic (BLoC) but doesn't use the flutter_bloc library - instead: riverpod.

Each feature should be built in its own self-contained folder under the "features" directory. Larger features should be broken up into the following subfolders but simpler ones can just have the files within.

- components: UI components
- screens: UI screen containers (ie. pages)
- models: data models representing the data of your feature
- providers: state management for the feature
- services: handling data from an external service / api

## Features

- state management reading/writing and watching to update UI
- singletons for things like storage
- localization
- responsiveness for breakpoints/scaling
- apply different screen/component layouts for desktop by overriding

## starting out

1. clone the repo
2. replace all instances of `flutter_skeleton` with your `project_name` (use the find replace tool in your IDE)
3. copy the .example_env as .dev_env and fill out as needed
4. remove and features not required as well as references to them
5. run generate function watcher below
6. run your app in chrome, ios, android, mac, etc.

## generate

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## l10n

- install Flutter Intl plugin (for your IDE)
- read the docs on that plugin, it is super helpful!
- TIP: You can highlight strings and then click the lightbulb to "extract arb"
- make sure the following is imported to the files that have localization

```
import 'package:flutter_skeleton/generated/l10n.dart';
```
