// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i16;
import 'package:flutter_skeleton/src/core/dashboard.dart' as _i7;
import 'package:flutter_skeleton/src/feature/auth/screens/auth_landing_screen.dart'
    as _i1;
import 'package:flutter_skeleton/src/feature/auth/screens/email_change_confirmation_screen.dart'
    as _i6;
import 'package:flutter_skeleton/src/feature/auth/screens/login_screen.dart'
    as _i8;
import 'package:flutter_skeleton/src/feature/auth/screens/register_screen.dart'
    as _i9;
import 'package:flutter_skeleton/src/feature/auth/screens/two_factor_confirmation_screen.dart'
    as _i10;
import 'package:flutter_skeleton/src/feature/auth/screens/update_password_screen.dart'
    as _i5;
import 'package:flutter_skeleton/src/feature/category/screens/category_list_screen.dart'
    as _i13;
import 'package:flutter_skeleton/src/feature/home/home_screen.dart' as _i11;
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_screen.dart'
    as _i12;
import 'package:flutter_skeleton/src/feature/settings/settings_screen.dart'
    as _i3;
import 'package:flutter_skeleton/src/feature/user/screens/edit_profile_screen.dart'
    as _i4;
import 'package:flutter_skeleton/src/feature/user/screens/profile_screen.dart'
    as _i15;
import 'package:flutter_skeleton/src/feature/user/screens/user_list_screen.dart'
    as _i14;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AuthLandingScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.AuthLandingScreen());
    },
    EmptyRouterPageRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SettingsScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SettingsScreen());
    },
    EditProfileScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.EditProfileScreen());
    },
    UpdatePasswordScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UpdatePasswordScreenRouteArgs>(
          orElse: () => UpdatePasswordScreenRouteArgs(
              token: pathParams.getString('token')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.UpdatePasswordScreen(key: args.key, token: args.token));
    },
    EmailChangeConfirmationScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EmailChangeConfirmationScreenRouteArgs>(
          orElse: () => EmailChangeConfirmationScreenRouteArgs(
              token: pathParams.getString('token')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.EmailChangeConfirmationScreen(
              key: args.key, token: args.token));
    },
    DashboardContainerRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.DashboardContainer());
    },
    LoginScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.LoginScreen());
    },
    RegisterScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.RegisterScreen());
    },
    TwoFactorConfirmationScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i10.TwoFactorConfirmationScreen());
    },
    HomeTabRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    CategoryTabRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    UsersTabRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.HomeScreen());
    },
    PlaceholderScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.PlaceholderScreen());
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.CategoryListScreen());
    },
    UserListScreenRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.UserListScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileScreenRouteArgs>(
          orElse: () =>
              ProfileScreenRouteArgs(uuid: pathParams.getString('uuid')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.ProfileScreen(key: args.key, uuid: args.uuid));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(AuthLandingScreenRoute.name, path: '/'),
        _i2.RouteConfig(EmptyRouterPageRoute.name, path: '/auth', children: [
          _i2.RouteConfig(LoginScreenRoute.name,
              path: 'login', parent: EmptyRouterPageRoute.name),
          _i2.RouteConfig(RegisterScreenRoute.name,
              path: 'register', parent: EmptyRouterPageRoute.name),
          _i2.RouteConfig(TwoFactorConfirmationScreenRoute.name,
              path: 'confirm/phone-number', parent: EmptyRouterPageRoute.name)
        ]),
        _i2.RouteConfig(SettingsScreenRoute.name, path: '/settings'),
        _i2.RouteConfig(EditProfileScreenRoute.name, path: '/settings/profile'),
        _i2.RouteConfig(UpdatePasswordScreenRoute.name,
            path: '/update-password/:token'),
        _i2.RouteConfig(EmailChangeConfirmationScreenRoute.name,
            path: '/email-change/:token'),
        _i2.RouteConfig(DashboardContainerRoute.name,
            path: '/dashboard',
            children: [
              _i2.RouteConfig('#redirect',
                  path: '',
                  parent: DashboardContainerRoute.name,
                  redirectTo: '/home',
                  fullMatch: true),
              _i2.RouteConfig(HomeTabRouter.name,
                  path: 'home',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i2.RouteConfig(HomeScreenRoute.name,
                        path: '', parent: HomeTabRouter.name),
                    _i2.RouteConfig(PlaceholderScreenRoute.name,
                        path: 'placeholder', parent: HomeTabRouter.name)
                  ]),
              _i2.RouteConfig(CategoryTabRouter.name,
                  path: 'categories',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i2.RouteConfig(CategoryListScreenRoute.name,
                        path: '', parent: CategoryTabRouter.name)
                  ]),
              _i2.RouteConfig(UsersTabRouter.name,
                  path: 'users',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i2.RouteConfig(UserListScreenRoute.name,
                        path: '', parent: UsersTabRouter.name),
                    _i2.RouteConfig(ProfileScreenRoute.name,
                        path: ':uuid', parent: UsersTabRouter.name),
                    _i2.RouteConfig('*#redirect',
                        path: '*',
                        parent: UsersTabRouter.name,
                        redirectTo: '',
                        fullMatch: true)
                  ])
            ]),
        _i2.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.AuthLandingScreen]
class AuthLandingScreenRoute extends _i2.PageRouteInfo<void> {
  const AuthLandingScreenRoute()
      : super(AuthLandingScreenRoute.name, path: '/');

  static const String name = 'AuthLandingScreenRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouterPageRoute extends _i2.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i2.PageRouteInfo>? children})
      : super(EmptyRouterPageRoute.name,
            path: '/auth', initialChildren: children);

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsScreenRoute extends _i2.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(SettingsScreenRoute.name, path: '/settings');

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i4.EditProfileScreen]
class EditProfileScreenRoute extends _i2.PageRouteInfo<void> {
  const EditProfileScreenRoute()
      : super(EditProfileScreenRoute.name, path: '/settings/profile');

  static const String name = 'EditProfileScreenRoute';
}

/// generated route for
/// [_i5.UpdatePasswordScreen]
class UpdatePasswordScreenRoute
    extends _i2.PageRouteInfo<UpdatePasswordScreenRouteArgs> {
  UpdatePasswordScreenRoute({_i16.Key? key, required String token})
      : super(UpdatePasswordScreenRoute.name,
            path: '/update-password/:token',
            args: UpdatePasswordScreenRouteArgs(key: key, token: token),
            rawPathParams: {'token': token});

  static const String name = 'UpdatePasswordScreenRoute';
}

class UpdatePasswordScreenRouteArgs {
  const UpdatePasswordScreenRouteArgs({this.key, required this.token});

  final _i16.Key? key;

  final String token;

  @override
  String toString() {
    return 'UpdatePasswordScreenRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i6.EmailChangeConfirmationScreen]
class EmailChangeConfirmationScreenRoute
    extends _i2.PageRouteInfo<EmailChangeConfirmationScreenRouteArgs> {
  EmailChangeConfirmationScreenRoute({_i16.Key? key, required String token})
      : super(EmailChangeConfirmationScreenRoute.name,
            path: '/email-change/:token',
            args:
                EmailChangeConfirmationScreenRouteArgs(key: key, token: token),
            rawPathParams: {'token': token});

  static const String name = 'EmailChangeConfirmationScreenRoute';
}

class EmailChangeConfirmationScreenRouteArgs {
  const EmailChangeConfirmationScreenRouteArgs({this.key, required this.token});

  final _i16.Key? key;

  final String token;

  @override
  String toString() {
    return 'EmailChangeConfirmationScreenRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i7.DashboardContainer]
class DashboardContainerRoute extends _i2.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i2.PageRouteInfo>? children})
      : super(DashboardContainerRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i8.LoginScreen]
class LoginScreenRoute extends _i2.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: 'login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterScreenRoute extends _i2.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(RegisterScreenRoute.name, path: 'register');

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i10.TwoFactorConfirmationScreen]
class TwoFactorConfirmationScreenRoute extends _i2.PageRouteInfo<void> {
  const TwoFactorConfirmationScreenRoute()
      : super(TwoFactorConfirmationScreenRoute.name,
            path: 'confirm/phone-number');

  static const String name = 'TwoFactorConfirmationScreenRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeTabRouter extends _i2.PageRouteInfo<void> {
  const HomeTabRouter({List<_i2.PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CategoryTabRouter extends _i2.PageRouteInfo<void> {
  const CategoryTabRouter({List<_i2.PageRouteInfo>? children})
      : super(CategoryTabRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoryTabRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class UsersTabRouter extends _i2.PageRouteInfo<void> {
  const UsersTabRouter({List<_i2.PageRouteInfo>? children})
      : super(UsersTabRouter.name, path: 'users', initialChildren: children);

  static const String name = 'UsersTabRouter';
}

/// generated route for
/// [_i11.HomeScreen]
class HomeScreenRoute extends _i2.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i12.PlaceholderScreen]
class PlaceholderScreenRoute extends _i2.PageRouteInfo<void> {
  const PlaceholderScreenRoute()
      : super(PlaceholderScreenRoute.name, path: 'placeholder');

  static const String name = 'PlaceholderScreenRoute';
}

/// generated route for
/// [_i13.CategoryListScreen]
class CategoryListScreenRoute extends _i2.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(CategoryListScreenRoute.name, path: '');

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i14.UserListScreen]
class UserListScreenRoute extends _i2.PageRouteInfo<void> {
  const UserListScreenRoute() : super(UserListScreenRoute.name, path: '');

  static const String name = 'UserListScreenRoute';
}

/// generated route for
/// [_i15.ProfileScreen]
class ProfileScreenRoute extends _i2.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({_i16.Key? key, required String uuid})
      : super(ProfileScreenRoute.name,
            path: ':uuid',
            args: ProfileScreenRouteArgs(key: key, uuid: uuid),
            rawPathParams: {'uuid': uuid});

  static const String name = 'ProfileScreenRoute';
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({this.key, required this.uuid});

  final _i16.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{key: $key, uuid: $uuid}';
  }
}
