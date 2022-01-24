import 'package:auto_route/auto_route.dart';
import 'package:flutter_skeleton/src/core/dashboard.dart';
import 'package:flutter_skeleton/src/feature/auth/screens/auth_landing_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/screens/login_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/screens/register_screen.dart';
import 'package:flutter_skeleton/src/feature/auth/screens/update_password_screen.dart';
import 'package:flutter_skeleton/src/feature/category/screens/category_list_screen.dart';
import 'package:flutter_skeleton/src/feature/home/home_screen.dart';
import 'package:flutter_skeleton/src/feature/placeholder/placeholder_screen.dart';
import 'package:flutter_skeleton/src/feature/settings/settings_screen.dart';
import 'package:flutter_skeleton/src/feature/user/screens/profile_screen.dart';
import 'package:flutter_skeleton/src/feature/user/screens/user_list_screen.dart';

const List<AutoRoute> appRoutes = [
  AutoRoute(initial: true, path: '/', page: AuthLandingScreen),
  AutoRoute(path: '/login', page: LoginScreen),
  AutoRoute(path: '/register', page: RegisterScreen),
  AutoRoute(path: '/settings', page: SettingsScreen),
  AutoRoute(path: '/update-password/:token', page: UpdatePasswordScreen),
  dashboardTabRouter,
  RedirectRoute(path: '*', redirectTo: '/'),
];

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}

const dashboardTabRouter = AutoRoute(
  path: "/dashboard",
  page: DashboardContainer,
  initial: true,
  children: [
    RedirectRoute(path: "", redirectTo: "/tab1"),
    AutoRoute(
      path: 'home',
      name: "HomeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: HomeScreen),
        AutoRoute(path: "placeholder", page: PlaceholderScreen),
      ],
    ),
    AutoRoute(
      path: 'categories',
      name: "CategoryTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: CategoryListScreen),
      ],
    ),
    AutoRoute(
      path: 'users',
      name: "UsersTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: UserListScreen),
        AutoRoute(path: ":id", page: ProfileScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
);
