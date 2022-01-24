import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';

// this does not actually need to be a stateful widget but including it this way for reference.

class AuthLandingScreen extends BaseStatefulScreen {
  const AuthLandingScreen({Key? key}) : super(key: key);

  @override
  _AuthLandingScreenState createState() => _AuthLandingScreenState();
}

class _AuthLandingScreenState extends BaseScreenState<AuthLandingScreen> {
  bool _loading = true;

  @override
  AppBar? appBar(BuildContext context) {
    return AppBar(
      title: const Text("Welcome"),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleSession(SessionModel session) {
    if (session.ready) {
      setState(() {
        _loading = false;
      });
    }

    if (session.isAuthenticated) {
      if (singleton<AppRouter>().current.path == '/') {
        AutoRouter.of(context).push(const DashboardContainerRoute());
      }
    }
  }

  @override
  Widget body(BuildContext context) {
    _handleSession(ref.read(sessionProvider));

    ref.listen<SessionModel>(sessionProvider, (prev, next) {
      _handleSession(next);
    });

    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const RegisterScreenRoute());
              },
              child: const Text("Register")),
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
