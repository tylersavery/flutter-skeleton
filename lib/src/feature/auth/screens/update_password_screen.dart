import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/loading_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/utils/toast.dart';
import 'package:flutter_skeleton/src/utils/validation.dart';

class UpdatePasswordScreen extends BaseStatefulScreen {
  final String token;

  const UpdatePasswordScreen({
    Key? key,
    @PathParam('token') required this.token,
  }) : super(key: key);

  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends BaseScreenState<UpdatePasswordScreen> {
  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Update Password"),
    );
  }

  Future<void> _showDialog() async {
    final password = await PromptModal.show(
      title: "Update Password",
      validator: formValidatorPassword,
      labelText: "New Password",
      obscureText: true,
      confirmText: "Update",
    );

    if (password == null) {
      return;
    }

    ref.read(loadingProvider.notifier).start();

    final success = await AuthService().completePasswordReset(
      password: password,
      token: widget.token,
    );
    if (success) {
      ref.read(loadingProvider.notifier).complete();
      singleton<AppRouter>().push(const LoginScreenRoute());
      Toast.message("Password updated successfully");
      return;
    } else {
      Toast.error();
    }
    ref.read(loadingProvider.notifier).complete();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _showDialog);
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _showDialog,
        child: const Text("Update Password"),
      ),
    );
  }
}
