import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/auth/auth_cubit/auth_cubit.dart';
import 'features/internet_connection/bloc/network_cubit.dart';
import 'features/loyalty_points/presentation/bloc/loyalty_points_bloc.dart';
import 'injection_container.dart' as di;

final List<BlocProvider> providers = [
  BlocProvider(create: (_) => di.sl<NetworkCubit>()),
  BlocProvider(create: (_) => di.sl<AppTheme>()),
  BlocProvider(create: (_) => di.sl<AuthCubit>()),
  BlocProvider(create: (_) => di.sl<LoyaltyPointsBloc>(), lazy: true),
];
