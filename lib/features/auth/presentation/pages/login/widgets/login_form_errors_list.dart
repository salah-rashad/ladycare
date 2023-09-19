import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/errors_list.dart';
import '../cubit/login_cubit.dart';

class LoginFormErrorsList extends StatelessWidget {
  const LoginFormErrorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, LoginError?>(
      selector: (state) {
        if (state is LoginError) return state;
        return null;
      },
      builder: (context, state) {
        if (state != null) {
          return ErrorsList(
            messages: [state.message],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
