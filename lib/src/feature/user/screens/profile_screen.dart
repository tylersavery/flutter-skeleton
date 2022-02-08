import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/core/components/empty_placeholder.dart';
import 'package:flutter_skeleton/src/feature/user/components/profile.dart';
import 'package:flutter_skeleton/src/feature/user/providers/user_detail_provider.dart';

class ProfileScreen extends BaseScreen {
  final String uuid;
  const ProfileScreen({Key? key, @PathParam('uuid') required this.uuid})
      : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailProvider(uuid));

    return user.when(
      loading: () => AppBar(
        title: const Text("Profile"),
      ),
      data: (user) => AppBar(
        title: Text(user.name),
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailProvider(uuid));

    return user.when(
      data: (user) => Profile(user: user),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
