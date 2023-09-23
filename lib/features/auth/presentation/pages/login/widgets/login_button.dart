import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../../../../../global/widgets/buttons/custom_elevated_button.dart';
import '../cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return CircularProgressIndicator(
            color: context.colors.primary,
          );
        } else {
          return CustomElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().login();
            },
            text: "الدخول",
          );
        }
      },
    );
  }
}
