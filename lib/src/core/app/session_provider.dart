import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton/src/app.dart';
import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app/storage.dart';
import 'package:flutter_skeleton/src/core/app_router.gr.dart';
import 'package:flutter_skeleton/src/core/dialogs/dialogs.dart';
import 'package:flutter_skeleton/src/feature/auth/models/token.dart';
import 'package:flutter_skeleton/src/feature/auth/services/auth_service.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';
import 'package:flutter_skeleton/src/feature/user/services/user_service.dart';

class SessionModel {
  final Token? token;
  final User? user;
  final bool isAuthenticated;

  const SessionModel({
    this.token,
    this.isAuthenticated = false,
    this.user,
  });
}

class SessionProvider extends StateNotifier<SessionModel> {
  final Reader read;
  Timer? _refreshTimer;

  static const _initial = SessionModel();

  SessionProvider(this.read, [SessionModel sessionModel = _initial])
      : super(sessionModel) {
    _init();
  }

  Future<void> _init() async {
    final tokenString = singleton<Storage>().getString(Token.AUTH_TOKEN_KEY);
    if (tokenString != null) {
      final token = Token.fromJson(jsonDecode(tokenString));

      if (token.accessTokenIsExpired()) {
        if (token.refreshTokenIsExpired()) {
          return;
        } else {
          final refreshedToken = await _refreshToken(token);
          if (refreshedToken != null) {
            await setToken(refreshedToken);
            return;
          }
        }
      }
      await setToken(token);
    }
  }

  Future<Token?> _refreshToken(Token token) async {
    return await AuthService().refresh(token.refresh);
  }

  Future<void> setToken(Token token) async {
    singleton<Storage>().setString(Token.AUTH_TOKEN_KEY, token.toJson());

    final user = await UserService().me();

    state = SessionModel(
      token: token,
      isAuthenticated: true,
      user: user,
    );

    int secondsUntilExpiry = token.secondsUntilExpiry();

    if (_refreshTimer != null) {
      _refreshTimer!.cancel();
    }

    _refreshTimer = Timer(Duration(seconds: secondsUntilExpiry), () async {
      final refreshedToken = await _refreshToken(token);
      if (refreshedToken != null) {
        setToken(refreshedToken);
      }
    });
  }

  Future<bool> logout() async {
    bool confirmed = await ConfirmDialog.show(
      title: "Logout",
      body: "Are you sure you want to logout?",
      destructive: true,
      confirmText: "Logout",
      cancelText: "Cancel",
    );

    if (!confirmed) {
      return false;
    }

    state = _initial;
    singleton<Storage>().remove(Token.AUTH_TOKEN_KEY);

    final context = rootNavigatorKey.currentContext!;
    AutoRouter.of(context).replace(const AuthLandingScreenRoute());
    return true;
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, SessionModel>(
  (ref) => SessionProvider(ref.read),
);
