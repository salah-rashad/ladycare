import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_bloc_observer.dart';
import 'core/constants/constants.dart';
import 'core/routes/go_router.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/light_app_theme.dart';
import 'core/utils/extensions.dart';
import 'features/auth/presentation/pages/auth/auth_cubit/auth_cubit.dart';
import 'features/internet_connection/bloc/network_cubit.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'providers.dart';

part 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await initializeDateFormatting(Constants.defaultLocaleString);
  await _initFirebase();
  await di.init();
  _setTransparentStatusbarColor();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providers,
        child: ScreenUtilInit(
          designSize: Constants.designSize,
          child: BlocBuilder<AppTheme, ThemeMode>(
            bloc: di.sl<AppTheme>(),
            builder: (context, state) {
              return MaterialApp.router(
                title: Constants.appName,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                themeMode: state, // ThemeMode.light,
                theme: AppTheme().light,
                darkTheme: AppTheme().dark,
                locale: Constants.defaultLocale,
                color: LightAppThemeExtensions().colors.primary,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ar'),
                  // Locale('en'),
                ],
                builder: _routeBuilder,
              );
            },
          ),
        ));
  }

  Widget _routeBuilder(context, child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocListener<AuthCubit, AuthState>(
        bloc: di.sl<AuthCubit>(),
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.replaceNamed(Routes.LOGIN.name);
          }
        },
        child: BlocBuilder<NetworkCubit, NetworkState>(
          bloc: di.sl<NetworkCubit>(),
          builder: (context, state) {
            switch (state) {
              case NetworkInitial():
                return _networkInitialView(context);
              case NetworkDisconnected():
              // return const NoInternetView();
              case NetworkConnected():
                return child ?? const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Material _networkInitialView(BuildContext context) {
    return Material(
      color: context.colors.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size.square(120.0)),
          child: context.images.logo.image(),
        ),
      ),
    );
  }
}
