import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/errors_list.dart';
import '../cubit/signup_cubit.dart';

class SignupFormErrorsList extends StatelessWidget {
  const SignupFormErrorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignupCubit, SignupState, SignupError?>(
      selector: (state) {
        if (state is SignupError) return state;
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
