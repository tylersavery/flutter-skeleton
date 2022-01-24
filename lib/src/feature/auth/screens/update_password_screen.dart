import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/providers/update_password_form_provider.dart';

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
    ref.read(updatePasswordFormProvider).showDialog(widget.token);
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
