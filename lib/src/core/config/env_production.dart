import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firebase_options.dart';
import '../constants/constants.dart';
import '../network/network_helper.dart';
import 'env.dart';

class EnvProduction implements Env {
  @override
  String get name => "Production";

  @override
  bool get useMock => false;

  @override
  Future<void> setupDependencies() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await initializeDateFormatting(Constants.defaultLocaleString);

    // ~~~~~~~~ Core ~~~~~~~~ //

    sl.registerLazySingleton<NetworkHelper>(
      () => InternetConnectionNetworkHelperImpl(sl()),
    );

    // ~~~~~~~~ Services ~~~~~~~~ //

    sl.registerLazySingleton(() => FirebaseAuth.instance);
    sl.registerLazySingleton(() => FirebaseFirestore.instance);
    sl.registerLazySingleton(() => FirebaseStorage.instance);

    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPrefs);

    final internetConnectionChecker = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 5),
    );
    sl.registerLazySingleton(() => internetConnectionChecker);
    sl.registerLazySingleton(() => Connectivity());
  }
}
