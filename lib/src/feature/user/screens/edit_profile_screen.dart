import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/components/auth_button.dart';
import 'package:flutter_skeleton/src/feature/user/components/edit_profile.dart';

class EditProfileScreen extends BaseScreen {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit Profile"),
      actions: const [AuthButton()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const EditProfile();
  }
}
