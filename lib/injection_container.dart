import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_helper.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/reset_password_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/pages/auth/auth_cubit/auth_cubit.dart';
import 'features/home/data/datasources/home_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_highlights_usecase.dart';
import 'features/home/domain/usecases/get_service_categories_usecase.dart';
import 'features/home/presentation/bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'features/home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import 'features/internet_connection/bloc/network_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ~~~~~~~~ Core ~~~~~~~~ //
  sl.registerSingleton(AppTheme());
  sl.registerLazySingleton<NetworkHelper>(() => NetworkInfoImpl(sl()));

  // ~~~~~~~~ Services ~~~~~~~~ //

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs);
  sl.registerLazySingleton(() => InternetConnection());

  // ~~~~~~~~ Features - Internet Connection ~~~~~~~~ //

  sl.registerLazySingleton(() => NetworkCubit(sl()));

  // ~~~~~~~~ Features - Authentication ~~~~~~~~ //

  // Blocs
  sl.registerLazySingleton(() => AuthCubit(sl(), sl()));

  // Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => SignupUsecase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(sl()));
  sl.registerLazySingleton(() => GetUserProfileUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Data Sources
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(sl(), sl()));

  // ~~~~~~~~ Features - Home ~~~~~~~~ //

  // Blocs
  sl.registerLazySingleton(() => HomeHighlightsCubit(sl()));
  sl.registerLazySingleton(() => HomeServiceCategoriesCubit(sl()));

  // Usecases
  sl.registerLazySingleton(() => GetHighlightsUsecase(sl()));
  sl.registerLazySingleton(() => GetServiceCategoriesUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl(), sl()));
  // Data Sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(sl()));
}
