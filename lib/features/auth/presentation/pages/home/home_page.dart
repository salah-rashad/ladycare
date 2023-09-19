import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../injection_container.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<AuthBloc>(),
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.replaceNamed(Routes.LOGIN.name);
        }
      },
      builder: (context, state) {
        switch (state) {
          case Authenticated():
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${state.userData?.email}"),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().logout();
                  },
                  child: const Text("logout"),
                )
              ],
            );
          case AuthError():
            return Center(
              child: Text("Error: ${state.message}"),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
