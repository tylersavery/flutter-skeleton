// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

enum RegisterFormStatus {
  Empty,
  Dirty,
  Processing,
  Success,
  Error,
}

class RegisterFormModel {
  final String email;
  final String password;
  final String username;
  final RegisterFormStatus status;

  const RegisterFormModel({
    this.email = '',
    this.password = '',
    this.username = '',
    this.status = RegisterFormStatus.Empty,
  });
}

class RegisterFormProvider extends StateNotifier<RegisterFormModel> {
  RegisterFormProvider(this.read, [RegisterFormModel model = _initial])
      : super(model) {
    emailController = TextEditingController(text: model.email);
    usernameController = TextEditingController(text: model.username);
    passwordController = TextEditingController(text: model.password);

    emailController.addListener(_updateState);
    usernameController.addListener(_updateState);
    passwordController.addListener(_updateState);
  }

  final Reader read;

  static const _initial = RegisterFormModel();

  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  void _updateState({
    RegisterFormStatus status = RegisterFormStatus.Dirty,
    bool clear = false,
  }) {
    state = RegisterFormModel(
      email: clear ? '' : emailController.value.text,
      username: clear ? '' : usernameController.value.text,
      password: clear ? '' : passwordController.value.text,
      status: status,
    );
  }

  String get email => emailController.value.text;
  String get username => usernameController.value.text;
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

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username required.";
    }

    if (!isValidUsername(value)) {
      return "Username not valid.";
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
    usernameController.text = "";
    passwordController.text = "";
    _updateState(status: RegisterFormStatus.Empty, clear: true);
  }

  Future<bool> _validateEmail(String email) {
    return AuthService().emailAvailable(email);
  }

  Future<bool> _validateUsername(String username) {
    return AuthService().usernameAvailable(username);
  }

  Future<void> submit() async {
    _updateState(status: RegisterFormStatus.Processing);

    if (!await _validateEmail(email)) {
      Toast.error("Email unavailable.");
      return;
    }

    if (!await _validateUsername(username)) {
      Toast.error("Username unavailable.");
      return;
    }

    final token = await AuthService().register(email, username, password);

    if (token != null) {
      await read(sessionProvider.notifier).setToken(token);

      singleton<AppRouter>().push(const DashboardContainerRoute());
      Toast.message("Thanks for joining!");
      clear();
      return;
    }

    Toast.error();
  }
}

final registerFormProvider =
    StateNotifierProvider<RegisterFormProvider, RegisterFormModel>((ref) {
  return RegisterFormProvider(ref.read);
});
