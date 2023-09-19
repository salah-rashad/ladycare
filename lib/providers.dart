import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login/cubit/login_cubit.dart';
import 'features/auth/presentation/pages/signup/cubit/signup_cubit.dart';
import 'injection_container.dart' as di;

final List<BlocProvider> providers = [
  BlocProvider(create: (_) => di.sl<AppTheme>()),
  // auth
  BlocProvider(create: (_) => di.sl<AuthBloc>()),
  BlocProvider(create: (_) => di.sl<LoginCubit>(), lazy: true),
  BlocProvider(create: (_) => di.sl<SignupCubit>(), lazy: true),
  // BlocProvider(create: (_) => di.sl<HomeBloc>(), lazy: true),
];
