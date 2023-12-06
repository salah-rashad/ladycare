import 'src/common/blocs/network_cubit/network_cubit.dart';
import 'src/common/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import 'src/core/config/env.dart';
import 'src/features/auth/data/datasources/auth_data_source.dart';
import 'src/features/auth/data/repositories/auth_repository_impl.dart';
import 'src/features/auth/domain/repositories/auth_repository.dart';
import 'src/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'src/features/auth/domain/usecases/login_usecase.dart';
import 'src/features/auth/domain/usecases/logout_usecase.dart';
import 'src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'src/features/auth/domain/usecases/signup_usecase.dart';
import 'src/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'src/features/home/data/datasources/home_data_source.dart';
import 'src/features/home/data/repositories/home_repository_impl.dart';
import 'src/features/home/domain/repositories/home_repository.dart';
import 'src/features/home/domain/usecases/get_highlights_usecase.dart';
import 'src/features/home/domain/usecases/get_tpl_service_categories_usecase.dart';
import 'src/features/home/domain/usecases/get_tpl_services_usecase.dart';
import 'src/features/home/presentation/bloc/home_cubit/home_cubit.dart';
import 'src/features/home/presentation/bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'src/features/home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import 'src/features/home/presentation/bloc/top_salons_cubit/top_salons_cubit.dart';
import 'src/features/salon/data/datasources/salon_data_source.dart';
import 'src/features/salon/data/repositories/salon_repository_impl.dart';
import 'src/features/salon/domain/repositories/salon_repository.dart';
import 'src/features/salon/domain/usecases/get_salons_usecase.dart';
import 'src/features/salon/domain/usecases/get_top_rated_salons_usecase.dart';
import 'src/features/salon/domain/usecases/search_salons_usecase.dart';
import 'src/features/salon/presentation/bloc/salon_search_cubit/salon_search_cubit.dart';

Future<void> setupAppDependencies() async {
  // ~~~~~~~~ Core ~~~~~~~~ //

  sl.registerSingleton(ThemeModeCubit());

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
