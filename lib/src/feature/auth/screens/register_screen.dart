import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/components/register_form.dart';

class RegisterScreen extends BaseScreen {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Create Account"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 360,
        child: RegisterForm(),
      ),
    );
  }
}
