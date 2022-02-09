import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/core/app/session_provider.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app_router.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/base_screen.dart';
import 'package:flutter_skeleton/src/core/components/buttons.dart';
import 'package:flutter_skeleton/src/core/components/centered_loader.dart';

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
  void initState() {
    super.initState();
    _handleSession(ref.read(sessionProvider));
  }

  @override
  Widget body(BuildContext context) {
    ref.listen<SessionModel>(sessionProvider, (prev, next) {
      _handleSession(next);
    });

    if (_loading) {
      return const CenteredLoader();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            onPressed: () {
              AutoRouter.of(context).replace(const LoginScreenRoute());
            },
            label: "Login",
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            onPressed: () {
              AutoRouter.of(context).replace(const RegisterScreenRoute());
            },
            label: "Register",
          ),
          const SizedBox(
            height: 16,
          ),
          AppButton(
            onPressed: () {
              AutoRouter.of(context).replace(const DashboardContainerRoute());
            },
            type: AppButtonType.Text,
            label: "Continue as Guest",
          ),
        ],
      ),
    );
  }
}
