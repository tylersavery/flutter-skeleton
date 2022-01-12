import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';

class HomeScreenProvider {
  HomeScreenProvider();

  handleEdit() {
    AutoRouter.of(rootNavigatorKey.currentContext!).pushNamed('placeholder');
  }
}

final homeScreenProvider = Provider((ref) {
  return HomeScreenProvider();
});
