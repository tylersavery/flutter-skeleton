import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/feature/locale/locale_provider.dart';
import 'package:flutter_skeleton/src/feature/theme/theme_provider.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

class SettingsFormModel {
  final ThemeMode theme;
  final Locale? locale;
  final bool isAuthenticated;
  final User? user;
  const SettingsFormModel({
    this.theme = ThemeMode.system,
    this.locale,
    this.isAuthenticated = false,
    this.user,
  });

  SettingsFormModel copyWith(
      {ThemeMode? theme, Locale? locale, bool? isAuthenticated, User? user}) {
    return SettingsFormModel(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }
}

class SettingsFormProvider extends StateNotifier<SettingsFormModel> {
  SettingsFormProvider(this.read, [SettingsFormModel model = _initial])
      : super(model);
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

  void changePassword() async {
    await PromptModal.show(
      title: "Change Password",
      validator: (String? value) =>
          formValidatorNotEmpty(value, "Current Password"),
      labelText: "Current Password",
      obscureText: true,
      seconaryInput: true,
      secondaryLabel: "New Password",
      secondaryValidator: formValidatorPassword,
      secondaryObscureText: true,
      onValidSubmission: (data) async {
        if (data.length < 2) return;
        final oldPassword = data[0];
        final newPassword = data[1];

        final success = await AuthService()
            .changePassword(oldPassword: oldPassword, newPassword: newPassword);

        if (success) {
          Navigator.of(rootNavigatorKey.currentContext!).pop();
          Toast.message("Password Changed");
        } else {
          Toast.error();
        }
      },
    );
  }
}

final settingsForm =
    StateNotifierProvider<SettingsFormProvider, SettingsFormModel>((ref) {
  final initial = SettingsFormModel(
    theme: ref.read(themeProvider),
    locale: ref.read(localeProvider),
    isAuthenticated: ref.watch(sessionProvider).isAuthenticated,
    user: ref.watch(sessionProvider).user,
  );

  return SettingsFormProvider(ref.read, initial);
});
