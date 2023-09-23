// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/auth/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/reset_password/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup/signup_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../injection_container.dart';
import 'routes.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.initial.path,
    redirect: (context, state) {
      final auth = sl<AuthCubit>();
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
          routes: [
            GoRoute(
              path: Routes.RESET_PASSWORD.path,
              name: Routes.RESET_PASSWORD.name,
              builder: (context, state) => const ResetPasswordPage(),
            ),
          ]),
      GoRoute(
        path: Routes.SIGN_UP.path,
        name: Routes.SIGN_UP.name,
        builder: (context, state) => const SignupPage(),
      ),
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
