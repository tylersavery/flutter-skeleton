// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter_skeleton/src/core/dashboard.dart' as _i5;
import 'package:flutter_skeleton/src/feature/auth/screens/auth_landing.dart'
    as _i1;
import 'package:flutter_skeleton/src/feature/auth/screens/login_screen.dart'
    as _i2;
import 'package:flutter_skeleton/src/feature/auth/screens/register_screen.dart'
    as _i3;
import 'package:flutter_skeleton/src/feature/category/screens/category_list_screen.dart'
    as _i9;
import 'package:flutter_skeleton/src/feature/home/home_screen.dart' as _i7;
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_screen.dart'
    as _i8;
import 'package:flutter_skeleton/src/feature/settings/settings_screen.dart'
    as _i4;
import 'package:flutter_skeleton/src/feature/user/screens/profile_screen.dart'
    as _i11;
import 'package:flutter_skeleton/src/feature/user/screens/user_list_screen.dart'
    as _i10;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthLandingScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.AuthLandingScreen());
    },
    LoginScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    SettingsScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SettingsScreen());
    },
    DashboardContainerRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.DashboardContainer());
    },
    HomeTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CategoryTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    UsersTabRouter.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    PlaceholderScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.PlaceholderScreen());
    },
    CategoryListScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.CategoryListScreen());
    },
    UserListScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.UserListScreen());
    },
    ProfileScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileScreenRouteArgs>(
          orElse: () => ProfileScreenRouteArgs(id: pathParams.getInt('id')));
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.ProfileScreen(key: args.key, id: args.id));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AuthLandingScreenRoute.name, path: '/'),
        _i6.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i6.RouteConfig(RegisterScreenRoute.name, path: '/register'),
        _i6.RouteConfig(SettingsScreenRoute.name, path: '/settings'),
        _i6.RouteConfig(DashboardContainerRoute.name,
            path: '/dashboard',
            children: [
              _i6.RouteConfig('#redirect',
                  path: '',
                  parent: DashboardContainerRoute.name,
                  redirectTo: '/tab1',
                  fullMatch: true),
              _i6.RouteConfig(HomeTabRouter.name,
                  path: 'home',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i6.RouteConfig(HomeScreenRoute.name,
                        path: '', parent: HomeTabRouter.name),
                    _i6.RouteConfig(PlaceholderScreenRoute.name,
                        path: 'placeholder', parent: HomeTabRouter.name)
                  ]),
              _i6.RouteConfig(CategoryTabRouter.name,
                  path: 'categories',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i6.RouteConfig(CategoryListScreenRoute.name,
                        path: '', parent: CategoryTabRouter.name)
                  ]),
              _i6.RouteConfig(UsersTabRouter.name,
                  path: 'users',
                  parent: DashboardContainerRoute.name,
                  children: [
                    _i6.RouteConfig(UserListScreenRoute.name,
                        path: '', parent: UsersTabRouter.name),
                    _i6.RouteConfig(ProfileScreenRoute.name,
                        path: ':id', parent: UsersTabRouter.name),
                    _i6.RouteConfig('*#redirect',
                        path: '*',
                        parent: UsersTabRouter.name,
                        redirectTo: '',
                        fullMatch: true)
                  ])
            ]),
        _i6.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.AuthLandingScreen]
class AuthLandingScreenRoute extends _i6.PageRouteInfo<void> {
  const AuthLandingScreenRoute()
      : super(AuthLandingScreenRoute.name, path: '/');

  static const String name = 'AuthLandingScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i6.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(RegisterScreenRoute.name, path: '/register');

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsScreenRoute extends _i6.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(SettingsScreenRoute.name, path: '/settings');

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i5.DashboardContainer]
class DashboardContainerRoute extends _i6.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i6.PageRouteInfo>? children})
      : super(DashboardContainerRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeTabRouter extends _i6.PageRouteInfo<void> {
  const HomeTabRouter({List<_i6.PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CategoryTabRouter extends _i6.PageRouteInfo<void> {
  const CategoryTabRouter({List<_i6.PageRouteInfo>? children})
      : super(CategoryTabRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoryTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class UsersTabRouter extends _i6.PageRouteInfo<void> {
  const UsersTabRouter({List<_i6.PageRouteInfo>? children})
      : super(UsersTabRouter.name, path: 'users', initialChildren: children);

  static const String name = 'UsersTabRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i8.PlaceholderScreen]
class PlaceholderScreenRoute extends _i6.PageRouteInfo<void> {
  const PlaceholderScreenRoute()
      : super(PlaceholderScreenRoute.name, path: 'placeholder');

  static const String name = 'PlaceholderScreenRoute';
}

/// generated route for
/// [_i9.CategoryListScreen]
class CategoryListScreenRoute extends _i6.PageRouteInfo<void> {
  const CategoryListScreenRoute()
      : super(CategoryListScreenRoute.name, path: '');

  static const String name = 'CategoryListScreenRoute';
}

/// generated route for
/// [_i10.UserListScreen]
class UserListScreenRoute extends _i6.PageRouteInfo<void> {
  const UserListScreenRoute() : super(UserListScreenRoute.name, path: '');

  static const String name = 'UserListScreenRoute';
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreenRoute extends _i6.PageRouteInfo<ProfileScreenRouteArgs> {
  ProfileScreenRoute({_i12.Key? key, required int id})
      : super(ProfileScreenRoute.name,
            path: ':id',
            args: ProfileScreenRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ProfileScreenRoute';
}

class ProfileScreenRouteArgs {
  const ProfileScreenRouteArgs({this.key, required this.id});

  final _i12.Key? key;

  final int id;

  @override
  String toString() {
    return 'ProfileScreenRouteArgs{key: $key, id: $id}';
  }
}
