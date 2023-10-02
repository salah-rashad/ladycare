// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../global/blocs/network_cubit/network_cubit.dart';
import '../../global/widgets/status_snack_bar.dart';
import '../../injection_container.dart';
import '../gen/assets.gen.dart';
import '../utils/extensions.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

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
        builder: (context, state) =>
            const HomePage()._wrapWithNetworkCheckerSnackBar(),
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
        ],
      ),
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

extension RoutePageExt on Widget {
  /* GoRouterWidgetBuilder _routeBuilder([bool internetRequired = true]) {
    if (internetRequired) {
      return (context, routeState) => BlocBuilder<NetworkCubit, NetworkState>(
            bloc: sl<NetworkCubit>(),
            builder: (context, state) {
              return switch (state) {
                NetworkInitial() ||
                NetworkDisconnected() =>
                  const NoInternetView(),
                NetworkConnected() => this,
              };
            },
          );
    } else {
      return (context, routeState) => this;
    }
  }

  Widget _wrapWithNetworkCheckerView() {
    return BlocBuilder<NetworkCubit, NetworkState>(
      bloc: sl<NetworkCubit>(),
      builder: (context, state) {
        return switch (state) {
          NetworkInitial() || NetworkDisconnected() => const NoInternetView(),
          NetworkConnected() => this,
        };
      },
    );
  } */

  Widget _wrapWithNetworkCheckerSnackBar() {
    return BlocListener<NetworkCubit, NetworkState>(
      bloc: sl<NetworkCubit>(),
      listener: (context, state) {
        switch (state) {
          case NetworkInitial():
          case NetworkDisconnected():
            context.showSnackbar(
              StatusSnackBar(
                context,
                text: "انقطع الإتصال بالإنترنت!",
                icon: Assets.solarIcons.boldDuotone.wiFiRouter,
                status: SnackBarStatus.error,
                showCloseIcon: true,
                duration: const Duration(seconds: 10),
              ),
            );
            break;
          case NetworkConnected():
            context.showSnackbar(
              StatusSnackBar(
                context,
                text: "تم الإتصال بالإنترنت.",
                icon: Assets.solarIcons.boldDuotone.wiFiRouter,
                status: SnackBarStatus.success,
                showCloseIcon: true,
                duration: const Duration(seconds: 10),
              ),
            );
            break;
        }
      },
      child: this,
    );
  }
}
