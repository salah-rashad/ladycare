import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../global/widgets/custom_text_field.dart';
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
          CustomTextField(
            autoCorrect: false,
            labelText: "البريد الإلكتروني",
            controller: cubit.emailController,
            validator: cubit.emailValidator,
            prefixIcon: Assets.solarIcons.broken.mentionCircle,
            textDirection: TextDirection.ltr,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
