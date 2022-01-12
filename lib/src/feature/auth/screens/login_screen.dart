import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/feature/auth/components/login_form.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Login"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 360,
        child: LoginForm(),
      ),
    );
  }
}
