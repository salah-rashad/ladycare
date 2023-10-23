import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_helper.dart';
import 'features/auth/data/datasources/auth_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/reset_password_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/home/data/datasources/home_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_highlights_usecase.dart';
import 'features/home/domain/usecases/get_tpl_service_categories_usecase.dart';
import 'features/home/domain/usecases/get_tpl_services_usecase.dart';
import 'features/home/presentation/bloc/home_cubit/home_cubit.dart';
import 'features/home/presentation/bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'features/home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import 'features/home/presentation/bloc/top_salons_cubit/top_salons_cubit.dart';
import 'features/salon/data/datasources/salon_data_source.dart';
import 'features/salon/data/repositories/salon_repository_impl.dart';
import 'features/salon/domain/repositories/salon_repository.dart';
import 'features/salon/domain/usecases/get_salons_usecase.dart';
import 'features/salon/domain/usecases/get_top_rated_salons_usecase.dart';
import 'features/salon/domain/usecases/search_salons_usecase.dart';
import 'features/salon/presentation/bloc/salon_search_cubit/salon_search_cubit.dart';
import 'global/blocs/network_cubit/network_cubit.dart';
import 'global/blocs/theme_mode_cubit/theme_mode_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ~~~~~~~~ Core ~~~~~~~~ //

  sl.registerSingleton(ThemeModeCubit());
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

  // ~~~~~~~~ Features - Internet Connection ~~~~~~~~ //

  sl.registerLazySingleton(() => NetworkCubit(sl()));

  // ~~~~~~~~ Features - Authentication ~~~~~~~~ //

  // Blocs
  sl.registerLazySingleton(() => AuthCubit(sl(), sl(), sl(), sl()));

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
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => HomeHighlightsCubit(sl()));
  sl.registerLazySingleton(() => HomeServiceCategoriesCubit(sl()));
  sl.registerLazySingleton(() => TopSalonsCubit(sl()));

  // Usecases
  sl.registerLazySingleton(() => GetHighlightsUsecase(sl()));
  sl.registerLazySingleton(() => GetTplServiceCategoriesUsecase(sl()));
  sl.registerLazySingleton(() => GetTplServicesUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl(), sl()));

  // Data Sources
  sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(sl(), sl()));

  // ~~~~~~~~ Features - Salon ~~~~~~~~ //

  // Blocs
  sl.registerLazySingleton(() => SalonSearchCubit(sl()));

  // Usecases
  sl.registerLazySingleton(() => GetSalonsUsecase(sl()));
  sl.registerLazySingleton(() => GetTopRatedSalonsUsecase(sl()));
  sl.registerLazySingleton(() => SearchSalonsUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<SalonRepository>(
      () => SalonRepositoryImpl(sl(), sl()));

  // Data Sources
  sl.registerLazySingleton<SalonDataSource>(
      () => SalonDataSourceImpl(sl(), sl()));
}
