import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'providers.dart';
import '../common/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../core/config/env.dart';
import '../core/constants/constants.dart';
import '../core/routes/go_router.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/light_app_theme.dart';
import '../core/utils/extensions.dart';

class LadyCareApp extends StatelessWidget {
  const LadyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providers,
        child: ScreenUtilInit(
          designSize: Constants.designSize,
          child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
            bloc: sl<ThemeModeCubit>(),
            builder: (context, state) {
              return MaterialApp.router(
                title: Constants.appName,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                themeMode: state.mode, // ThemeMode.light,
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

  Widget _routeBuilder(BuildContext context, Widget? child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child ?? _initialView(context),
    );
  }

  Material _initialView(BuildContext context) {
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
