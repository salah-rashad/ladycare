// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/home/home_page.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/signup/signup_page.dart';
import '../../injection_container.dart';
import 'routes.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.HOME.path,
    redirect: (context, state) {
      final auth = sl<AuthBloc>();
      bool isAuthenticated = auth.isAuthenticated;
      bool isAuthRoute = (state.fullPath ?? "").contains("auth/");
      if (!isAuthenticated && !isAuthRoute) {
        return Routes.LOGIN.path;
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: Routes.HOME.path,
        name: Routes.HOME.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.LOGIN.path,
        name: Routes.LOGIN.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.SIGNUP.path,
        name: Routes.SIGNUP.name,
        builder: (context, state) => const SignupPage(),
      ),
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
