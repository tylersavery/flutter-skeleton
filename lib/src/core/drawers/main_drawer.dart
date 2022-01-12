import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';

class MainDrawer extends BaseComponent {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _sessionProvider = ref.watch(sessionProvider);

    final _isAuthenticated =
        _sessionProvider.isAuthenticated && _sessionProvider.user != null;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                AutoRouter.of(context).replace(const DashboardContainerRoute());
              },
            ),
            ListTile(
              title: const Text("Settings"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pop();
                AutoRouter.of(context).replace(const SettingsScreenRoute());
              },
            ),
            if (_isAuthenticated)
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  if (await ref.read(sessionProvider.notifier).logout()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            if (!_isAuthenticated)
              ListTile(
                title: const Text("Login"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pop();
                  AutoRouter.of(context).replace(const LoginScreenRoute());
                },
              )
          ],
        ),
      ),
    );
  }
}
