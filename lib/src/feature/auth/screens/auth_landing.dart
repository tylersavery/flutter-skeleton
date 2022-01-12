import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

class AuthLandingScreen extends BaseScreen {
  const AuthLandingScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Welcome"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const LoginScreenRoute());
              },
              child: const Text("Login")),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Register")),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const DashboardContainerRoute());
              },
              child: const Text("Continue as Guest")),
        ],
      ),
    );
  }
}
