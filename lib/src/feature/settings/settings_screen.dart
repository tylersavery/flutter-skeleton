import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/auth/components/auth_button.dart';
import 'package:flutter_skeleton/src/feature/settings/settings_form.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Settings"),
      actions: const [AuthButton()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _form = ref.read(settingsForm.notifier);
    final _formModel = ref.watch(settingsForm);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Theme:"),
        DropdownButton<ThemeMode>(
          value: _formModel.theme,
          onChanged: (value) {
            switch (value) {
              case ThemeMode.dark:
                _form.setDark();
                break;
              case ThemeMode.light:
                _form.setLight();
                break;
              case ThemeMode.system:
                _form.setSystem();
                break;
              default:
                break;
            }
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
        if (_form.isAuthenticated)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.error),
            onPressed: _form.logout,
            child: const Text("Logout"),
          ),
        if (!_form.isAuthenticated)
          ElevatedButton(
            onPressed: _form.handleLogin,
            child: const Text("Login"),
          )
      ],
    );
  }
}
