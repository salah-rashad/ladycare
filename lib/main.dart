import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'core/observer/app_bloc_observer.dart';
import 'core/constants/constants.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

part 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await initializeDateFormatting(Constants.defaultLocaleString);
  await di.init();

  await _initFirebase();
  _setTransparentStatusbarColor();
  _setPreferredOrientations();

  runApp(const LadyCareApp());
}
