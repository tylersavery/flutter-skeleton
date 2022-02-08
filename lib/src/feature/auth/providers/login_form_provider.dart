// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/env.dart';
import 'package:flutter_skeleton/src/core/app/loading_provider.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

enum LoginFormStatus {
  Empty,
  Dirty,
  Processing,
  Success,
  Error,
}

class LoginFormModel {
  final String email;
  final String password;
  final LoginFormStatus status;

  const LoginFormModel({
    this.email = '',
    this.password = '',
    this.status = LoginFormStatus.Empty,
  });

  get isProcessing {
    return status == LoginFormStatus.Processing;
  }
}

class LoginFormProvider extends StateNotifier<LoginFormModel> {
  LoginFormProvider(this.read, [LoginFormModel model = _initial])
      : super(model) {
    emailController = TextEditingController(text: model.email);
    passwordController = TextEditingController(text: model.password);

    emailController.addListener(_updateState);
    passwordController.addListener(_updateState);

    // Debug helper for remembering the preferred login credentials
    // Can be updated in the .env file
    if (Env.debug) {
      state = LoginFormModel(
        email: Env.debugLoginEmail,
        password: Env.debugLoginPassword,
        status: Env.debugLoginEmail.isEmpty && Env.debugLoginPassword.isEmpty
            ? LoginFormStatus.Empty
            : LoginFormStatus.Dirty,
      );

      emailController.text = Env.debugLoginEmail;
      passwordController.text = Env.debugLoginPassword;
    }
  }

  final Reader read;

  static const _initial = LoginFormModel();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  void _updateState({
    LoginFormStatus status = LoginFormStatus.Dirty,
    bool clear = false,
  }) {
    state = LoginFormModel(
      email: clear ? '' : emailController.value.text,
      password: clear ? '' : passwordController.value.text,
      status: status,
    );
  }

  String get email => emailController.value.text;
  String get password => passwordController.value.text;

  String? emailValidator(String? value) => formValidatorEmail(value);

  String? passwordValidator(String? value) => formValidatorPassword(value);

  void clear() {
    emailController.text = Env.debug ? Env.debugLoginEmail : "";
    passwordController.text = Env.debug ? Env.debugLoginPassword : "";
    _updateState(status: LoginFormStatus.Empty, clear: true);
  }

  Future<void> forgotPassword() async {
    final data = await PromptModal.show(
      title: "Reset Password",
      labelText: "Your email address",
      validator: formValidatorEmail,
    );

    if (data == null || data.isEmpty) return;

    final email = data.first;

    final success = await AuthService().requestPasswordReset(email: email);
    if (success) {
      Toast.message("Check your email");
    } else {
      Toast.error();
    }
  }

  Future<void> submit() async {
    _updateState(status: LoginFormStatus.Processing);

    read(loadingProvider.notifier).start();

    final loginResult =
        await AuthService().login(email: email, password: password);

    if (loginResult != null) {
      if (loginResult.twoFa) {
        read(sessionProvider.notifier)
            .setMetaData({'email': email, 'password': password});

        singleton<AppRouter>().push(const TwoFactorConfirmationScreenRoute());
        Toast.message(
            "A confirmation code has been sent to your phone number.");
        read(loadingProvider.notifier).complete();

        return;
      }

      if (loginResult.token != null) {
        await read(sessionProvider.notifier).setToken(loginResult.token!);
        read(loadingProvider.notifier).complete();

        singleton<AppRouter>().push(const DashboardContainerRoute());
        Toast.message("Welcome back!");
        clear();

        return;
      }
    }

    read(loadingProvider.notifier).complete();

    Toast.error();
  }
}

final loginFormProvider =
    StateNotifierProvider<LoginFormProvider, LoginFormModel>((ref) {
  return LoginFormProvider(ref.read);
});
