import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/loading_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

class UpdatePasswordFormProvider {
  Reader read;
  UpdatePasswordFormProvider(this.read);

  Future<void> showDialog(String token) async {
    final data = await PromptModal.show(
      title: "Update Password",
      validator: formValidatorPassword,
      labelText: "New Password",
      obscureText: true,
      confirmText: "Update",
    );

    if (data == null || data.isEmpty) {
      return;
    }

    final password = data.first;

    read(loadingProvider.notifier).start();

    final success = await AuthService().completePasswordReset(
      password: password,
      token: token,
    );
    if (success) {
      read(loadingProvider.notifier).complete();
      singleton<AppRouter>().push(const LoginScreenRoute());
      Toast.message("Password updated successfully");
      return;
    } else {
      Toast.error();
    }
    read(loadingProvider.notifier).complete();
  }
}

final updatePasswordFormProvider = Provider(
  (ref) => UpdatePasswordFormProvider(ref.read),
);
