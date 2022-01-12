import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/locale/locale_provider.dart';
import 'package:flutter_skeleton/src/feature/theme/theme_provider.dart';

class SettingsFormModel {
  final ThemeMode theme;
  final Locale? locale;
  final bool isAuthenticated;
  const SettingsFormModel({
    this.theme = ThemeMode.system,
    this.locale,
    this.isAuthenticated = false,
  });

  SettingsFormModel copyWith(
      {ThemeMode? theme, Locale? locale, bool? isAuthenticated}) {
    return SettingsFormModel(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class SettingsFormProvider extends StateNotifier<SettingsFormModel> {
  SettingsFormProvider(this.read, [SettingsFormModel model = _initial])
      : super(model) {
    // state = SettingsFormModel(
    //   theme: read(themeProvider),
    //   locale: read(localeProvider),
    //   isAuthenticated: read(sessionProvider).isAuthenticated,
    // );
  }
  final Reader read;

  static const _initial = SettingsFormModel();

  //Theme
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

  // Locale

  List<Locale> get supportedLocales {
    return LocaleProvider.supportedLocales;
  }

  void setLocale(Locale locale) {
    read(localeProvider.notifier).setLocale(locale);
    state = state.copyWith(locale: locale);
  }

  // Session
  void logout() {
    read(sessionProvider.notifier).logout();
    state = state.copyWith(isAuthenticated: false);
  }

  void handleLogin() {
    AutoRouter.of(rootNavigatorKey.currentContext!)
        .push(const LoginScreenRoute());
  }
}

final settingsForm =
    StateNotifierProvider<SettingsFormProvider, SettingsFormModel>((ref) {
  final initial = SettingsFormModel(
    theme: ref.read(themeProvider),
    locale: ref.read(localeProvider),
    isAuthenticated: ref.watch(sessionProvider).isAuthenticated,
  );

  return SettingsFormProvider(ref.read, initial);
});
