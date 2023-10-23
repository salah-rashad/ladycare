import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/home/presentation/bloc/home_cubit/home_cubit.dart';
import 'features/home/presentation/bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'features/home/presentation/bloc/home_service_categories_cubit/home_service_categories_cubit.dart';
import 'features/home/presentation/bloc/top_salons_cubit/top_salons_cubit.dart';
import 'features/salon/presentation/bloc/salon_search_cubit/salon_search_cubit.dart';
import 'global/blocs/network_cubit/network_cubit.dart';
import 'global/blocs/theme_mode_cubit/theme_mode_cubit.dart';
import 'injection_container.dart' as di;

final List<BlocProvider> providers = [
  BlocProvider(create: (_) => di.sl<NetworkCubit>()),
  BlocProvider(create: (_) => di.sl<ThemeModeCubit>()),
  BlocProvider(create: (_) => di.sl<AuthCubit>()),

  // home
  BlocProvider(create: (_) => di.sl<HomeCubit>(), lazy: true),
  BlocProvider(create: (_) => di.sl<HomeHighlightsCubit>(), lazy: true),
  BlocProvider(create: (_) => di.sl<HomeServiceCategoriesCubit>(), lazy: true),
  BlocProvider(create: (_) => di.sl<TopSalonsCubit>(), lazy: true),

  // salon
  BlocProvider(create: (_) => di.sl<SalonSearchCubit>(), lazy: true),
];
