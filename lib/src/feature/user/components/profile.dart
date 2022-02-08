import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';

class Profile extends BaseComponent {
  final User user;

  const Profile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Text(user.name);
  }
}
