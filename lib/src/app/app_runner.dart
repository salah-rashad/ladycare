// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/date_symbol_data_local.dart';

// import '../../firebase_options.dart';
// import '../core/constants/constants.dart';
// import 'app.dart';
// import 'app_bloc_observer.dart';

// /// Sets up application dependencies and runs the app.
// Future<void> runApplication() async {
//   // Env.current = ProductionEnv();

//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = AppBlocObserver();

//   await initializeDateFormatting(Constants.defaultLocaleString);

//   // Env.current.init();

//   await _initFirebase();
//   _setTransparentStatusbarColor();
//   _setPreferredOrientations();

//   runApp(const LadyCareApp());
// }

// Future<void> _initFirebase() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

// void _setTransparentStatusbarColor() {
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//     ),
//   );
// }

// void _setPreferredOrientations() {
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
// }
