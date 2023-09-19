import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_bloc_observer.dart';
import 'core/constants/constants.dart';
import 'core/routes/go_router.dart';
import 'core/theme/app_theme.dart';
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
                themeMode: /* state */ ThemeMode.light,
                theme: AppTheme().light,
                darkTheme: AppTheme().dark,
                locale: Constants.defaultLocale,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ar'),
                  // Locale('en'),
                ],
                builder: (context, child) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: child ?? const SizedBox.shrink(),
                  );
                },
              );
            },
          ),
        ));
  }
}
