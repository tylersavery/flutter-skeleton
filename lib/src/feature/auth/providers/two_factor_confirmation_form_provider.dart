// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/loading_provider.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/shared_enums.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

class TwoFactorConfirmationFormModel {
  final String code;
  final String email;
  final String password;
  final FormStatus status;

  const TwoFactorConfirmationFormModel({
    this.code = '',
    this.email = '',
    this.password = '',
    this.status = FormStatus.Empty,
  });

  get isProcessing {
    return status == FormStatus.Processing;
  }

  TwoFactorConfirmationFormModel copyWith({
    String? code,
    String? email,
    String? password,
    FormStatus? status,
  }) {
    return TwoFactorConfirmationFormModel(
      code: code ?? this.code,
      email: email ?? this.email,
      status: status ?? this.status,
      password: password ?? this.password,
    );
  }
}

class TwoFactorConfirmationFormProvider
    extends StateNotifier<TwoFactorConfirmationFormModel> {
  TwoFactorConfirmationFormProvider(this.read,
      [TwoFactorConfirmationFormModel model = _initial])
      : super(model) {
    codeController = TextEditingController(text: model.code);

    codeController.addListener(_updateState);
  }

  final Reader read;

  static const _initial = TwoFactorConfirmationFormModel();

  late final TextEditingController codeController;

  void _updateState({
    FormStatus status = FormStatus.Dirty,
    bool clear = false,
  }) {
    state = TwoFactorConfirmationFormModel(
      code: clear ? '' : codeController.value.text,
      status: status,
    );
  }

  String get code => codeController.value.text;
  String get email => state.email;
  String get password => state.password;

  String? codeValidator(String? value) =>
      formValidatorNotEmpty(value, "Confirmation Code");

  void clear() {
    codeController.text = "";

    _updateState(status: FormStatus.Empty, clear: true);
  }

  Future<void> resendCode() async {
    // TODO: implement
    return;
    read(loadingProvider.notifier).start();

    final _email = read(sessionProvider).metaData['email'] ?? '';
    final _password = read(sessionProvider).metaData['password'] ?? '';
    await AuthService().login(email: _email, password: _password);

    Toast.message("New OTP sent");
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  Future<void> submit() async {
    _updateState(status: FormStatus.Processing);
    read(loadingProvider.notifier).start();

    final _email = read(sessionProvider).metaData['email'] ?? '';
    final _password = read(sessionProvider).metaData['password'] ?? '';

    final loginResult = await AuthService()
        .login(email: _email, otpCode: code, password: _password);

    if (loginResult == null || loginResult.token == null) {
      read(loadingProvider.notifier).complete();
      Toast.error("Invalid OTP Code");
      return;
    }

    await read(sessionProvider.notifier).setToken(loginResult.token!);
    read(loadingProvider.notifier).complete();

    singleton<AppRouter>().push(const DashboardContainerRoute());
    Toast.message("Welcome back!");
    clear();
  }
}

final twoFactorConfirmationFormProvider = StateNotifierProvider<
    TwoFactorConfirmationFormProvider, TwoFactorConfirmationFormModel>((ref) {
  return TwoFactorConfirmationFormProvider(ref.read);
});
