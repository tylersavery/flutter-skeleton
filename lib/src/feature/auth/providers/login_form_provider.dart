// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/env.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email required.";
    }
    if (!isValidEmail(value)) {
      return "Invalid email.";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password required.";
    }

    if (!isValidPassword(value)) {
      return "Password not strong enough.";
    }

    return null;
  }

  void clear() {
    emailController.text = "";
    passwordController.text = "";
    _updateState(status: LoginFormStatus.Empty, clear: true);
  }

  Future<void> submit() async {
    _updateState(status: LoginFormStatus.Processing);

    final token = await AuthService().login(email, password);

    if (token != null) {
      await read(sessionProvider.notifier).setToken(token);

      singleton<AppRouter>().push(const DashboardContainerRoute());
      Toast.message("Welcome back!");
      clear();
      return;
    }

    Toast.error();
  }
}

final loginFormProvider =
    StateNotifierProvider<LoginFormProvider, LoginFormModel>((ref) {
  return LoginFormProvider(ref.read);
});
