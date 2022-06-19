import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_component.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';

class UserCard extends BaseComponent {
  final User user;
  const UserCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(ProfileScreenRoute(uuid: user.uuid));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user.username),
        ),
      ),
    );
  }
}
