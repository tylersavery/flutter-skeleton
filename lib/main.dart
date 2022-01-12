import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/env.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  setPathUrlStrategy();
  await initAppModule();

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: ProviderScope(
      child: App(),
    ),
  ));
}
