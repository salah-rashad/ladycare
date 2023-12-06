import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app/app.dart';
import 'src/app/app_bloc_observer.dart';
import 'src/core/config/env.dart';
import 'src/core/config/env_production.dart';
import 'src/core/utils/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  Env.setup(EnvProduction());
  Env.init();

  setTransparentStatusbarColor();
  setPreferredOrientations();

  runApp(const LadyCareApp());
}
