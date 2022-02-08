import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';

class EmailChangeProvider {
  Reader read;
  EmailChangeProvider(this.read);

  Future<void> changeEmail(String token) async {
    final success = await AuthService().completeEmailChange(token: token);

    if (success) {
      await read(sessionProvider.notifier).refreshUser();
      Toast.message("Email updated successfully.");
    } else {
      Toast.error("A problem occurred and your email was not updated.");
    }

    AutoRouter.of(rootNavigatorKey.currentContext!)
        .push(const DashboardContainerRoute());
  }
}

final emailChangeProvider = Provider(
  (ref) => EmailChangeProvider(ref.read),
);
