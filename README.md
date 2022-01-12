# flutter_skeleton

Flutter app skeleton using flutter_riverpod, dotenv, auto_route, get_it, freezed, and dio

## starting out

1. clone the repo
2. replace all instances of `flutter_skeleton` with your `project_name`
3. copy the .example_env as .dev_env and fill out as needed
4. remove and features not required as well as references to them
5. run generate function watcher below
6. build

## generate

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## l10n

- install Flutter Intl plugin (for your IDE)
- You can highlight strings and then click the lightbulb to "extract arb"
- make sure the following is imported to the files that have localization

```
import 'package:flutter_skeleton/generated/l10n.dart';
```
