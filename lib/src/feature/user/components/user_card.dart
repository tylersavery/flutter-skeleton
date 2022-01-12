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
          // GoRouter.of(context).push(Routes.userDetail.routeWithId(user.id));
          AutoRouter.of(context).push(ProfileScreenRoute(id: user.id));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user.fullName),
        ),
      ),
    );
  }
}
