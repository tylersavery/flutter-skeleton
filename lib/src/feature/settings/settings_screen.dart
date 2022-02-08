import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/src/feature/auth/components/auth_button.dart';
import 'package:flutter_skeleton/src/feature/settings/settings_form.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(S.of(context).settingsScreenTitle),
      actions: const [AuthButton()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const SettingsForm();
  }
}
