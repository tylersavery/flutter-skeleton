import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/theme/theme_provider.dart';

class SettingsFormModel {
  final ThemeMode theme;

  const SettingsFormModel({
    this.theme = ThemeMode.system,
  });

  SettingsFormModel copyWith({ThemeMode? theme, bool? authenticated}) {
    return SettingsFormModel(
      theme: theme ?? this.theme,
    );
  }
}

class SettingsForm extends StateNotifier<SettingsFormModel> {
  SettingsForm(this.read, [SettingsFormModel model = _initial]) : super(model) {
    state = SettingsFormModel(
      theme: read(themeProvider),
    );
  }
  final Reader read;

  static const _initial = SettingsFormModel();

  void setDark() {
    read(themeProvider.notifier).setDark();
    state = state.copyWith(theme: ThemeMode.dark);
  }

  void setLight() {
    read(themeProvider.notifier).setLight();
    state = state.copyWith(theme: ThemeMode.light);
  }

  void setSystem() {
    read(themeProvider.notifier).setSystem();
    state = state.copyWith(theme: ThemeMode.system);
  }

  void logout() {
    state = state.copyWith(authenticated: false);
    read(sessionProvider.notifier).logout();
  }

  bool get isAuthenticated {
    return read(sessionProvider).isAuthenticated;
  }

  void handleLogin() {
    AutoRouter.of(rootNavigatorKey.currentContext!).push(LoginScreenRoute());
  }
}

final settingsForm =
    StateNotifierProvider<SettingsForm, SettingsFormModel>((ref) {
  return SettingsForm(ref.read);
});
