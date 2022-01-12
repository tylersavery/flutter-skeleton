import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';

class AuthButton extends BaseComponent {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _sessionProvider = ref.watch(sessionProvider);

    final _isAuthenticated =
        _sessionProvider.isAuthenticated && _sessionProvider.user != null;

    return TextButton(
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: () {
        if (_isAuthenticated) {
          AutoRouter.of(context).push(const SettingsScreenRoute());
        } else {
          AutoRouter.of(context).push(LoginScreenRoute());
        }
      },
      child: Text(
        _isAuthenticated ? ref.read(sessionProvider).user!.fullName : "Login",
      ),
    );
  }
}
