import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/blocs/network_cubit/network_cubit.dart';
import '../common/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import '../core/config/env.dart';
import '../features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import '../features/home/presentation/bloc/home_cubit/home_cubit.dart';
import '../features/home/presentation/bloc/home_highlights_cubit/home_highlights_cubit.dart';
import '../features/home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import '../features/home/presentation/bloc/top_salons_cubit/top_salons_cubit.dart';
import '../features/salon/presentation/bloc/salon_search_cubit/salon_search_cubit.dart';

final List<BlocProvider> providers = [
  BlocProvider(create: (_) => sl<NetworkCubit>()),
  BlocProvider(create: (_) => sl<ThemeModeCubit>()),
  BlocProvider(create: (_) => sl<AuthCubit>()),

  // home
  BlocProvider(create: (_) => sl<HomeCubit>(), lazy: true),
  BlocProvider(create: (_) => sl<HomeHighlightsCubit>(), lazy: true),
  BlocProvider(create: (_) => sl<HomeServiceCategoriesCubit>(), lazy: true),
  BlocProvider(create: (_) => sl<TopSalonsCubit>(), lazy: true),

  // salon
  BlocProvider(create: (_) => sl<SalonSearchCubit>(), lazy: true),
];
