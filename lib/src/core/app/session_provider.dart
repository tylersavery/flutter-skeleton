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
  final bool ready;
  final Map<String, dynamic> metaData;

  const SessionModel({
    this.token,
    this.isAuthenticated = false,
    this.user,
    this.ready = false,
    this.metaData = const {},
  });

  SessionModel copyWith(
      {Token? token,
      User? user,
      bool? isAuthenticated,
      bool? ready,
      Map<String, dynamic>? metaData}) {
    return SessionModel(
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      ready: ready ?? this.ready,
      metaData: metaData ?? this.metaData,
    );
  }
}

class SessionProvider extends StateNotifier<SessionModel> {
  final Reader read;
  Timer? _refreshTimer;

  static const _initial = SessionModel();

  SessionProvider(this.read, [SessionModel sessionModel = _initial])
      : super(sessionModel) {
    init();
  }

  Future<void> init() async {
    final tokenString = singleton<Storage>().getString(Token.AUTH_TOKEN_KEY);
    if (tokenString != null) {
      final token = Token.fromJson(jsonDecode(tokenString));

      if (token.accessTokenIsExpired()) {
        if (!token.refreshTokenIsExpired()) {
          final refreshedToken = await _refreshToken(token);
          if (refreshedToken != null) {
            await setToken(refreshedToken);
            return;
          }
        }
      }
      await setToken(token);
      return;
    }

    state = state.copyWith(ready: true, isAuthenticated: false);
  }

  Future<Token?> _refreshToken(Token token) async {
    return await AuthService().refresh(token.refresh);
  }

  Future<void> setToken(Token token) async {
    singleton<Storage>().setString(Token.AUTH_TOKEN_KEY, token.toJson());

    final user = await UserService().me();

    state = state.copyWith(
      token: token,
      isAuthenticated: true,
      user: user,
      ready: true,
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

  Future<void> refreshUser() async {
    final user = await UserService().me();
    state = state.copyWith(user: user);
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

    state = state.copyWith(
      ready: true,
      isAuthenticated: false,
      user: null,
      token: null,
    );
    singleton<Storage>().remove(Token.AUTH_TOKEN_KEY);

    final context = rootNavigatorKey.currentContext!;
    AutoRouter.of(context).replace(const AuthLandingScreenRoute());
    return true;
  }

  void setMetaData(Map<String, dynamic> data) {
    Map<String, dynamic> metaData = {...state.metaData};

    state = state.copyWith(
      metaData: {...metaData, ...data},
    );
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, SessionModel>(
  (ref) => SessionProvider(ref.read),
);
