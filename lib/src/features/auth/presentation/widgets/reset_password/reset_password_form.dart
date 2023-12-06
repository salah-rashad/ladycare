import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/custom_input_decoration.dart';
import '../../bloc/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: CustomInputDecoration(
              labelText: "البريد الإلكتروني",
              prefixIcon: Assets.solarIcons.broken.mentionCircle,
            ),
            autocorrect: false,
            controller: cubit.emailController,
            validator: cubit.emailValidator,
            textDirection: TextDirection.ltr,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
