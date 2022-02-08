import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/components/two_factor_confirmation_form.dart';

class TwoFactorConfirmationScreen extends BaseScreen {
  const TwoFactorConfirmationScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Confirm Phone Number"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 360,
        child: TwoFactorConfirmation(),
      ),
    );
  }
}
