import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/core/components/centered_loader.dart';
import 'package:flutter_skeleton/src/feature/auth/providers/email_change_provider.dart';
import 'package:flutter_skeleton/src/feature/auth/providers/update_password_form_provider.dart';

class EmailChangeConfirmationScreen extends BaseStatefulScreen {
  final String token;

  const EmailChangeConfirmationScreen({
    Key? key,
    @PathParam('token') required this.token,
  }) : super(key: key);

  @override
  _EmailChangeConfirmationScreenState createState() =>
      _EmailChangeConfirmationScreenState();
}

class _EmailChangeConfirmationScreenState
    extends BaseScreenState<EmailChangeConfirmationScreen> {
  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Change Email"),
    );
  }

  Future<void> _confirm() async {
    ref.read(emailChangeProvider).changeEmail(widget.token);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _confirm);
  }

  @override
  Widget body(BuildContext context) {
    return const CenteredLoader();
  }
}
