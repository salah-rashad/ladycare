import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../../../../../shared/widgets/buttons/custom_elevated_button.dart';
import '../cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        if (state is SignupLoading) {
          return CircularProgressIndicator(
            color: context.palette.primary,
          );
        } else {
          return CustomElevatedButton(
            onPressed: () {
              context.read<SignupCubit>().signup();
            },
            text: "إنشاء حساب جديد",
          );
        }
      },
    );
  }
}
